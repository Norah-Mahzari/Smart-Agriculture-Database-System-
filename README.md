# Smart Agriculture Database System

A relational database designed to help farms manage crops, fields, sensors, smart irrigation, weather data, and supplier relationships — built to support data-driven decisions in resource optimization and productivity.

## Overview

This project models the full data lifecycle of a smart farm: from farms and their fields, to the crops planted, the sensors monitoring soil and weather conditions, and the irrigation systems triggered by that sensor data. It also tracks the farmers managing the operation and their suppliers.

## Database Structure

The schema includes 10 normalized tables:

| Table | Purpose |
|---|---|
| `farm` | Stores farm name and total area |
| `field` | Sub-areas within a farm, including soil type |
| `crop` | Crop catalog (name, type) |
| `croprecord` | Planting/harvest history per field and crop |
| `plantedin` | Many-to-many link between fields and crops |
| `sensor` | Sensors (moisture, temperature, humidity) placed per field |
| `smartirrigation` | Irrigation events triggered by sensor readings |
| `weather` | Weather readings logged per farm |
| `farmer` | Farmer profiles |
| `supplier` | Supplier profiles (seeds, fertilizer, etc.) |
| `workswith` | Many-to-many link between farmers and suppliers |
| `farmerscommunity` | Community/group data for farmers |

## Key Design Features

- **Normalized relational schema** with primary and foreign keys enforcing referential integrity across all tables
- **Many-to-many relationships** handled through junction tables (`plantedin`, `workswith`)
- **Sensor-to-irrigation pipeline**: each `smartirrigation` record links back to the `sensor` that triggered it, enabling traceability from raw sensor data to irrigation action
- **Environmental context**: `weather` and `croprecord` tables capture the conditions each crop was grown under, supporting future yield analysis

## Tech Stack

- MySQL (InnoDB engine)
- Designed and exported via phpMyAdmin

## Sample Data

The dump includes sample records for 2 farms, 3 fields, 3 crop types, 2 sensors, and their related irrigation and weather events — enough to demonstrate the relationships end-to-end.

## Author

Norah Yahya Mahzari — Management Information Systems, Jazan University
