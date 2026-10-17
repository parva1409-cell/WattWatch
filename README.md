# ⚡ WattWatch: Smart City Energy Consumption Analysis

## 📌 Project Overview

WattWatch is a data analysis project focused on understanding urban electricity consumption. It uses SQL and Microsoft Excel to analyze smart meter readings, compare energy usage across city zones, estimate electricity costs, and examine meter faults and outages.

## 🎯 Project Objectives

- Analyze energy consumption across five city zones.
- Identify the highest-consuming smart meters.
- Study monthly electricity consumption trends.
- Estimate electricity costs across different zones.
- Examine meter faults, outages, and operational reliability.
- Compare weekday and weekend peak usage.
- Present insights through an Excel dashboard.

## 🛠️ Tools and Technologies

- **MySQL Workbench** — Database management and SQL analysis
- **Microsoft Excel** — Data summaries, charts, and dashboard
- **CSV** — Dataset storage and data import

## 📂 Project Files

| File | Description |
|---|---|
| `SmartCityEnergy.csv` | Smart-city energy consumption dataset |
| `SmartCity_SQL.sql` | Database setup and SQL analysis queries |
| `WattWatchDashboard.xlsx` | Interactive-style Excel dashboard and visualizations |
| `EnergyFindings.txt` | Key findings and actionable recommendations |

## 📊 Dataset Description

The project uses a synthetic dataset containing **10,000 smart meter daily readings** collected across five city zones from January 1 to April 10, 2025.

The dataset includes:

- Meter ID
- City zone
- Consumer type
- Date
- Energy consumed (kWh)
- Peak usage (kWh)
- Outage duration (minutes)
- Meter status
- Tariff rate

## 🔍 Analysis Performed

The SQL analysis covers:

1. Total and average energy consumption by zone.
2. Top five energy-consuming meters.
3. Monthly energy consumption trends.
4. Estimated electricity costs by zone.
5. Faulty meters and outage records.
6. Operational reliability across zones.
7. Weekday versus weekend peak usage.

## 💡 Key Findings

- **North** recorded the highest total energy consumption at 108,386.46 kWh.
- **South** recorded the lowest total energy consumption at 52,021.57 kWh.
- **Meter M0029**, an industrial meter in the East zone, recorded the highest consumption at 19,125.12 kWh.
- All five highest-consuming meters were classified as industrial consumers.
- The analysis supports further investigation into energy efficiency, peak demand, and meter reliability.

## 📈 Dashboard

The Excel dashboard summarizes important energy metrics and presents zone-wise consumption, monthly trends, consumer-type comparisons, and other key indicators through charts and formulas.

## 🚀 How to Use

1. Download or clone this repository.
2. Open `SmartCity_SQL.sql` in MySQL Workbench.
3. Execute the database and table creation statements.
4. Import `SmartCityEnergy.csv` into the `SmartCityEnergy` table.
5. Run the SQL analysis queries.
6. Open `WattWatchDashboard.xlsx` in Microsoft Excel to explore the dashboard.
7. Review `EnergyFindings.txt` for key findings and recommendations.

## ⚠️ Disclaimer

This project uses **synthetic data created for educational purposes**. The results do not represent actual electricity consumption in a real city.

## 🎓 Project Purpose

WattWatch demonstrates practical skills in SQL, data analysis, spreadsheet-based visualization, and analytical reporting, with a focus on smarter urban energy management.
