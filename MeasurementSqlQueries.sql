/*We can use similar queries for the measurements table to test query execution time. 
Below are examples of the select and update queries for the measurements table:*/

/* 5.1. Select Queries
5.1.1. Simple Select Query*/

-- Select all rows

SELECT *
FROM sdeproject.measurements
LIMIT 0, 50000;

-- The commands are executed for different scale factors as 5000, 10000, 15000, etc. 

-- 5.1.2. Select Query with a Condition
-- Select rows where Value is greater than 100

SELECT *
FROM sdeproject.measurements
WHERE Value > 100
LIMIT 0, 20000;

-- The commands are executed for different scale factors as 5000, 10000, 15000, 20000 etc. 

-- 5.2. Update Queries
-- Q1: Update Value to 500 where Latitude < 0

UPDATE sdeproject.measurements
SET Value = 500
WHERE Latitude < 0;

-- Q2: Update Radiation to 'High' where Latitude > 0 and Latitude < 30

UPDATE sdeproject.measurements
SET Radiation = 'High'
WHERE Latitude > 0 AND Latitude < 30;

-- Q3: Update Height to 'Tall' where Latitude > 30

UPDATE sdeproject.measurements 
SET 
    Height = 'Tall'
WHERE
    Latitude > 30;
    
