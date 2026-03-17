#!/bin/bash

echo "Starting DoConnect Auth Service on port 8081..."
cd /app/backend-java/auth-service
java -jar target/auth-service-1.0.0.jar
