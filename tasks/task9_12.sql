
-- Exercise 3 — Tasks 9-12 (schema half)
-- Run this against the "FinalProject" database.
-- In pgAdmin: right-click Databases -> Create -> Database... name it


-- Task 9: dimension table DimDate
CREATE TABLE DimDate (
    DateID       INTEGER PRIMARY KEY,
    Date         DATE,
    Year         INTEGER,
    Quarter      INTEGER,
    QuarterName  VARCHAR(2),
    Month        INTEGER,
    MonthName    VARCHAR(20),
    Day          INTEGER,
    Weekday      INTEGER,
    WeekdayName  VARCHAR(20)
);

-- Task 10: dimension table DimTruck
CREATE TABLE DimTruck (
    TruckID    INTEGER PRIMARY KEY,
    TruckType  VARCHAR(20)
);

-- Task 11: dimension table DimStation
CREATE TABLE DimStation (
    StationID  INTEGER PRIMARY KEY,
    City       VARCHAR(50)
);

-- Task 12: fact table FactTrips
CREATE TABLE FactTrips (
    TripID          INTEGER PRIMARY KEY,
    DateID          INTEGER REFERENCES DimDate(DateID),
    StationID       INTEGER REFERENCES DimStation(StationID),
    TruckID         INTEGER REFERENCES DimTruck(TruckID),
    WasteCollected  NUMERIC(10,2)
);

-- Load order matters because of the foreign keys above:
-- DimDate and DimStation and DimTruck first, FactTrips last.
