
-- ============================================================
-- Script Name  : Database Initialization / Reset Script
-- Database     : madhu
--
-- Purpose:
--     1. Drop the 'madhu' database if it already exists.
--     2. Recreate the 'madhu' database.
--     3. Create the Bronze, Silver, and Gold schemas.
--
-- WARNING:
--     This script will permanently delete the 'madhu' database
--     and ALL data, tables, views, procedures, and other objects
--     contained within it.
--
--     The script uses ROLLBACK IMMEDIATE, which will terminate
--     active connections to the database and roll back their
--     uncommitted transactions.
--
-- IMPORTANT:
--     - Make sure you have a valid backup before running this script.
--     - Make sure no important users or applications are connected.
--     - Run this script from the 'master' database, NOT from 'madhu'.
--     - This script is primarily intended for development/testing.
--
-- DATA WAREHOUSE LAYERS:
--
--     Bronze:
--         Raw/source data with minimal transformation.
--
--     Silver:
--         Cleaned, standardized, and transformed data.
--
--     Gold:
--         Business-ready data used for reporting, analytics,
--         dashboards, and other consumption purposes.
--
-- ============================================================


-- ============================================================
-- 1. Switch to the master database
-- ============================================================

USE master;
GO


-- ============================================================
-- 2. Drop the database if it already exists
-- ============================================================

IF DB_ID('madhu') IS NOT NULL
BEGIN
    ALTER DATABASE madhu
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE madhu;
END;
GO


-- ============================================================
-- 3. Create the database
-- ============================================================

CREATE DATABASE madhu;
GO


-- ============================================================
-- 4. Switch to the newly created database
-- ============================================================

USE madhu;
GO


-- ============================================================
-- 5. Create Data Warehouse Schemas
-- ============================================================

-- Bronze Layer: Raw data
CREATE SCHEMA bronze;
GO

-- Silver Layer: Cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Gold Layer: Business-ready / reporting data
CREATE SCHEMA gold;
GO


-- ============================================================
-- 6. Verify Database and Schemas
-- ============================================================

SELECT
    DB_NAME() AS CurrentDatabase;

SELECT
    name AS SchemaName
FROM sys.schemas
WHERE name IN ('bronze', 'silver', 'gold')
ORDER BY name;
GO
