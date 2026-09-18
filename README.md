# Waste Management Data Warehouse
**Overview**

This project is a data warehouse design and implementation project for a solid waste management company operating across major cities in Brazil.

The company collects and recycles solid waste using hundreds of trucks of different types. The objective of the project is to design and implement a data warehouse that can organize the company's waste collection data and support analytical reporting.

## Business Scenario

You are a data engineer hired by a solid waste management company. The company collects and recycles solid waste across major cities in the country of Brazil.

The company operates hundreds of trucks of different types to collect and transport solid waste. To improve reporting and analysis, the company wants to create a data warehouse that can provide information about waste collection across different cities, time periods, truck types, and stations.

The data warehouse should support reports such as:

Total waste collected per year per city
Total waste collected per month per city
Total waste collected per quarter per city
Total waste collected per year per truck type
Total waste collected per truck type per city
Total waste collected per truck type per station per city

The purpose of this project is to apply data warehousing concepts to design and implement a database capable of supporting these analytical requirements.

## Project Objectives

The main objectives are to:

Design a suitable data warehouse structure for the waste management company.
Load the provided waste-management datasets into the database.
Organize data using dimension and fact tables.
Use SQL to analyse waste collection activities.
Generate analytical results based on time, city, truck type, and station.
Support the reporting requirements specified in the business scenario.
Repository Structure
waste-management-schema/
│
├── waste-dataset/
│   ├── DimDate.csv
│   ├── DimStation.csv
│   ├── DimTruck.csv
│   └── FactTrips.csv
│
├── tasks/
│   ├── aggregate_funcs.sql
│   ├── task5_8.sql
│   └── task9_12.sql
│
├── waste-scenario tasks.pdf
└── README.md
Dataset

The waste-dataset folder contains the CSV files provided for the project.

DimDate

Contains date-related information used to perform time-based analysis, including reporting by year, month, and quarter.

DimStation

Contains information about waste collection stations.

DimTruck

Contains information about the trucks used by the company, including truck types.

FactTrips

Contains waste collection trip records and connects the operational measurements to the relevant dimensions.

Together, these datasets support analysis across time, city, truck type, and station.

SQL Tasks

The tasks folder contains the SQL code developed for the project.

aggregate_funcs.sql

Contains SQL aggregation functions used to analyse and summarize waste collection data.

task5_8.sql

Contains the SQL solutions for Tasks 5–8.

task9_12.sql

Contains the SQL solutions for Tasks 9–12.

## PostgreSQL Only

⚠️ IMPORTANT: ALL SQL CODE IN THIS REPOSITORY MUST BE RUN IN POSTGRESQL.

The SQL scripts were written specifically for PostgreSQL.

You can execute the scripts using:

pgAdmin
psql
Another PostgreSQL-compatible SQL client

Do not assume that the SQL scripts will work without modification in MySQL, Microsoft SQL Server, Oracle, SQLite, or other database systems.

## Recommended Setup
Install PostgreSQL.
Open pgAdmin or another PostgreSQL client.
Create a PostgreSQL database for the project.
Create the required tables based on the project requirements.
Import the CSV files from the waste-dataset folder.
Run the SQL scripts from the tasks folder.
Review the query results against the reporting requirements in the scenario.
Reporting Requirements

The completed data warehouse should support analysis of:

Analysis	Dimensions
Total waste collected per year per city	Year, City
Total waste collected per month per city	Month, City
Total waste collected per quarter per city	Quarter, City
Total waste collected per year per truck type	Year, Truck Type
Total waste collected per truck type per city	Truck Type, City
Total waste collected per truck type per station per city	Truck Type, Station, City
Scenario Document

The complete original scenario and task instructions are available in:

waste-scenario tasks.pdf

Refer to this document for the original project requirements and task specifications.

Technologies
Database: PostgreSQL
SQL: PostgreSQL SQL
Database Management: pgAdmin / psql
Data Format: CSV
Data Warehousing: Fact and Dimension Tables
Important Note

This repository contains the datasets and SQL work associated with the waste-management data warehouse project.

Run the SQL code only in PostgreSQL.

Author

Taurai Pbaiwa
