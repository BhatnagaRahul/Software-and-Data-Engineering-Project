-- Making ID as primary key for updates action authorization.

ALTER TABLE building_permits
ADD PRIMARY KEY (ID);

/*5.1. Select Query 
The select query is used for retrieving records from a table. The following queries are used to check the 
performance of the two databases in case of select.*/

-- 5.1.1.Simple Select Query 

SELECT 
    *
FROM
    sdeproject.building_permits
LIMIT 0 , 25000;

-- The commands are executed for different scale factors as 3000, 4000, etc. 

-- 5.1.2.Select Query with a Condition 

select * from sdeproject.building_permits where street_number>1000 LIMIT 0,3300; 

-- The commands are executed for different scale factors as 3000, 4000, etc. 

/*5.2.UPDATE Command 
The update statements are executed using both MongoDB studio 3T and MySQL Workbench for the two 
datasets D1 and D2. Theupdate statements are executed for the following three cases and are labelled and shown 
below as Q1, Q2 and Q3.*/

-- So below is the solution which were preventing updates as street number wasn't primary key so it was considering it unsafe update.
SET SQL_SAFE_UPDATES = 0;

/*• Q1: To update the contractor_1_type to Architect where street_number<1000 */

UPDATE sdeproject.building_permits SET CONTACT_1_TYPE = 'ARCHITECT' WHERE STREET_NUMBER < 1000;

/*• Q2: To update the contractor_1_type to Civil where street_number>1000 and street_number<5000 */

UPDATE sdeproject.building_permits SET CONTACT_1_TYPE = 'CIVIL' WHERE STREET_NUMBER > 1000 AND STREET_NUMBER < 5000; 

/*• Q3: To update the contractor_1_type to architect where street_number>5000. */

UPDATE sdeproject.building_permits 
SET 
    CONTACT_1_TYPE = 'ARCHITECT'
WHERE
    STREET_NUMBER > 1000
        AND STREET_NUMBER < 5000; 

/*5.3. INSERT Command 
For executing the INSERT statement both the datasets D1 and D2 are used and the statements are executed 
with six scale factors of 10000, 25000, 50000, 75000, 100000 and 125000.

-- Set the number of rows you want to insert
SET @NumRows = 25000; -- You can change this to the desired number

-- Loop to insert random dummy rows
WHILE @NumRows > 0 DO
    INSERT INTO building_permits (
        PERMIT_TYPE,
        REVIEW_TYPE,
        APPLICATION_START_DATE,
        ISSUE_DATE,
        PROCESSING_TIME,
        STREET_NUMBER,
        STREET_DIRECTION,
        STREET_NAME,
        SUFFIX,
        WORK_DESCRIPTION,
        BUILDING_FEE_PAID,
        ZONING_FEE_PAID,
        OTHER_FEE_PAID,
        SUBTOTAL_PAID,
        BUILDING_FEE_UNPAID,
        ZONING_FEE_UNPAID,
        OTHER_FEE_UNPAID,
        SUBTOTAL_UNPAID,
        BUILDING_FEE_WAIVED,
        ZONING_FEE_WAIVED,
        OTHER_FEE_WAIVED,
        SUBTOTAL_WAIVED,
        TOTAL_FEE,
        CONTACT_1_TYPE,
        CONTACT_1_NAME,
        CONTACT_1_CITY,
        CONTACT_1_STATE,
        CONTACT_1_ZIPCODE,
        -- Repeat for other CONTACT columns
        REPORTED_COST,
        PIN1,
        PIN2,
        PIN3,
        PIN4,
        PIN5,
        PIN6,
        PIN7,
        PIN8,
        PIN9,
        PIN10,
        COMMUNITY_AREA,
        CENSUS_TRACT,
        WARD,
        XCOORDINATE,
        YCOORDINATE,
        LATITUDE,
        LONGITUDE,
        LOCATION
    )
    VALUES (
        -- Generate random data for each column
        -- You can use functions like RAND() for random values
        -- For example: RAND() * 100 for a random number between 0 and 100

        -- Repeat for each column
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(CURRENT_DATE() AS CHAR(10)),
        CAST(CURRENT_DATE() AS CHAR(10)),
        CAST(RAND() * 100 AS INT),
        CAST(RAND() * 1000 AS INT),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        -- Repeat for other columns
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(UUID() AS CHAR(36)),
        -- Repeat for other CONTACT columns
        CAST(RAND() * 1000 AS DECIMAL(10, 2)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36)),
        CAST(UUID() AS CHAR(36))
    );

    SET @NumRows = @NumRows - 1;
END WHILE;
*/

