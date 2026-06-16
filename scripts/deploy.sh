#!/bin/bash

echo "Stopping containers..."
docker compose down

echo "Building and starting..."
docker compose up --build -d

echo "Checking containers..."
docker ps

echo "Testing backend..."
curl http://localhost/api/health
