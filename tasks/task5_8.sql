
-- Exercise 2 — Tasks 5-8
-- Run this against the "Project" database.
-- In pgAdmin: right-click Databases -> Create -> Database... name it


-- Task 5: dimension table MyDimDate
CREATE TABLE MyDimDate (
    dateid        INTEGER PRIMARY KEY,
    fulldate      DATE,
    day           INTEGER,
    month         INTEGER,
    monthname     VARCHAR(20),
    quarter       INTEGER,
    quartername   VARCHAR(2),
    year          INTEGER,
    weekday       INTEGER,
    weekdayname   VARCHAR(20)
);

-- Task 6: dimension table MyDimWaste
CREATE TABLE MyDimWaste (
    wasteid        INTEGER PRIMARY KEY,
    trucktype      VARCHAR(30),
    wastecategory  VARCHAR(30)
);

-- Task 7: dimension table MyDimZone
CREATE TABLE MyDimZone (
    zoneid      INTEGER PRIMARY KEY,
    stationid   INTEGER,
    city        VARCHAR(50),
    region      VARCHAR(50)
);

-- Task 8: fact table MyFactTrips
CREATE TABLE MyFactTrips (
    tripid          INTEGER PRIMARY KEY,
    dateid          INTEGER REFERENCES MyDimDate(dateid),
    zoneid          INTEGER REFERENCES MyDimZone(zoneid),
    wasteid         INTEGER REFERENCES MyDimWaste(wasteid),
    wastecollected  NUMERIC(10,2)
);
