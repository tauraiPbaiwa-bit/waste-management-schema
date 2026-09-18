
-- Exercise 4 — Tasks 13-16
-- Run all of this against the "FinalProject" database, after the

-- Task 13: GROUPING SETS
-- Columns: stationid, trucktype, total waste collected.
-- One query returns three breakdowns in one result set:
--   (station, trucktype) pairs, station totals alone, and
--   trucktype totals alone.
SELECT
    ft.StationID,
    dt.TruckType,
    SUM(ft.WasteCollected) AS TotalWasteCollected
FROM FactTrips ft
JOIN DimTruck dt ON ft.TruckID = dt.TruckID
GROUP BY GROUPING SETS (
    (ft.StationID, dt.TruckType),
    (ft.StationID),
    (dt.TruckType)
)
ORDER BY ft.StationID, dt.TruckType;



-- Task 14: ROLLUP
-- Columns: year, city, stationid, total waste collected.
-- Produces a hierarchical drill-down: year -> year+city ->
-- year+city+station -> grand total.
-- -------------------------------------------------------------
SELECT
    dd.Year,
    ds.City,
    ft.StationID,
    SUM(ft.WasteCollected) AS TotalWasteCollected
FROM FactTrips ft
JOIN DimDate dd    ON ft.DateID = dd.DateID
JOIN DimStation ds ON ft.StationID = ds.StationID
GROUP BY ROLLUP (dd.Year, ds.City, ft.StationID)
ORDER BY dd.Year, ds.City, ft.StationID;


-- Task 15: CUBE
-- Columns: year, city, stationid, average waste collected.
-- Returns every combination of the three dimensions (not just
-- the hierarchical ones ROLLUP gives), so you can slice by any
-- subset of year/city/station.

SELECT
    dd.Year,
    ds.City,
    ft.StationID,
    AVG(ft.WasteCollected) AS AverageWasteCollected
FROM FactTrips ft
JOIN DimDate dd    ON ft.DateID = dd.DateID
JOIN DimStation ds ON ft.StationID = ds.StationID
GROUP BY CUBE (dd.Year, ds.City, ft.StationID)
ORDER BY dd.Year, ds.City, ft.StationID;


-- -------------------------------------------------------------
-- Task 16: Materialized view max_waste_stats
-- Columns: city, stationid, trucktype, max waste collected.
-- Precomputes the maximum single trip's waste for every
-- city/station/trucktype combination, so downstream reports read
-- an already-aggregated table instead of re-scanning FactTrips.

CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    ds.City,
    ft.StationID,
    dt.TruckType,
    MAX(ft.WasteCollected) AS MaxWasteCollected
FROM FactTrips ft
JOIN DimStation ds ON ft.StationID = ds.StationID
JOIN DimTruck dt   ON ft.TruckID = dt.TruckID
GROUP BY ds.City, ft.StationID, dt.TruckType
WITH DATA;

-- Check it:
SELECT * FROM max_waste_stats ORDER BY City, StationID, TruckType LIMIT 20;

-- If the underlying data ever changes, refresh with:
-- REFRESH MATERIALIZED VIEW max_waste_stats;
