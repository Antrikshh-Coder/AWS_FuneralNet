#!/bin/bash

mysql -u root -p < 01_create_schema.sql

mysql -u root -p < 02_seed_data.sql

echo "FuneralNet database created."


