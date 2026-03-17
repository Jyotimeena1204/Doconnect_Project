#!/bin/bash

echo "Starting DoConnect Discussion Service on port 8082..."
cd /app/backend-java/discussion-service
java -jar target/discussion-service-1.0.0.jar
