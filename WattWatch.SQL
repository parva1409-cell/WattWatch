-- WattWatch energy analysis project
-- Setup: Run this script in MySQL Workbench. It creates the database and
-- table only when they do not already exist, then runs the seven analysis queries.
-- Import SmartCityEnergy.csv separately into the existing SmartCityEnergy table
-- using MySQL Workbench's Table Data Import Wizard. Map the CSV columns to the
-- matching table columns; do not create a second table or run INSERT statements.

CREATE DATABASE IF NOT EXISTS WattWatchDB;
USE WattWatchDB;

CREATE TABLE IF NOT EXISTS SmartCityEnergy (
    MeterID VARCHAR(10) NOT NULL,
    Zone VARCHAR(20) NOT NULL,
    ConsumerType VARCHAR(30) NOT NULL,
    `Date` DATE NOT NULL,
    EnergyConsumed_kWh DECIMAL(10, 2) NOT NULL,
    PeakUsage_kWh DECIMAL(10, 2) NOT NULL,
    OutageMinutes INT NOT NULL DEFAULT 0,
    MeterStatus VARCHAR(20) NOT NULL,
    TariffRate DECIMAL(8, 2) NOT NULL
);

USE WattWatchDB;

-- Query 1: Total and average energy consumption by zone
SELECT
    Zone,
    SUM(EnergyConsumed_kWh) AS TotalConsumption_kWh,
    ROUND(AVG(EnergyConsumed_kWh), 2) AS AverageConsumption_kWh
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY TotalConsumption_kWh DESC;


-- Query 2: Top 5 energy-consuming meters
SELECT
    MeterID,
    Zone,
    ConsumerType,
    SUM(EnergyConsumed_kWh) AS TotalConsumption_kWh
FROM SmartCityEnergy
GROUP BY MeterID, Zone, ConsumerType
ORDER BY TotalConsumption_kWh DESC
LIMIT 5;


-- Query 3: Monthly energy consumption trends by zone
SELECT
    DATE_FORMAT(`Date`, '%Y-%m') AS Month,
    Zone,
    ROUND(SUM(EnergyConsumed_kWh), 2) AS TotalConsumption_kWh
FROM SmartCityEnergy
GROUP BY DATE_FORMAT(`Date`, '%Y-%m'), Zone
ORDER BY Month, Zone;


-- Query 4: Estimated electricity cost by zone
SELECT
    Zone,
    ROUND(SUM(EnergyConsumed_kWh * TariffRate), 2) AS TotalEstimatedCost
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY TotalEstimatedCost DESC;


-- Query 5: Identify meters with faults or outages
SELECT
    MeterID,
    Zone,
    ConsumerType,
    SUM(OutageMinutes) AS TotalOutageMinutes,
    COUNT(CASE WHEN MeterStatus = 'Faulty' THEN 1 END) AS FaultyReadings
FROM SmartCityEnergy
WHERE OutageMinutes > 0 OR MeterStatus = 'Faulty'
GROUP BY MeterID, Zone, ConsumerType
ORDER BY TotalOutageMinutes DESC
LIMIT 10;


-- Query 6: Compare operational reliability by zone
SELECT
    Zone,
    COUNT(*) AS TotalReadings,
    SUM(CASE WHEN MeterStatus = 'Active' THEN 1 ELSE 0 END) AS ActiveReadings,
    ROUND(
        100.0 * SUM(CASE WHEN MeterStatus = 'Active' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS ActiveReadingPercentage,
    SUM(OutageMinutes) AS TotalOutageMinutes
FROM SmartCityEnergy
GROUP BY Zone
ORDER BY ActiveReadingPercentage DESC;


-- Query 7: Compare weekday and weekend energy usage
SELECT
    CASE
        WHEN DAYOFWEEK(`Date`) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS DayType,
    ROUND(AVG(PeakUsage_kWh), 2) AS AveragePeakUsage_kWh,
    ROUND(SUM(EnergyConsumed_kWh), 2) AS TotalConsumption_kWh
FROM SmartCityEnergy
GROUP BY DayType;

