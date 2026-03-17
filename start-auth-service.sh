#!/bin/bash

echo "========================================"
echo "  DoConnect Backend Services Startup  "
echo "========================================"
echo ""

# Start MySQL if not running
echo "Checking MySQL service..."
service mariadb status || service mariadb start
sleep 2

echo ""
echo "Starting all microservices..."
echo ""

# Start Auth Service in background
echo "[1/3] Starting Auth Service (port 8081)..."
cd /app/backend-java/auth-service
java -jar target/auth-service-1.0.0.jar > /tmp/auth-service.log 2>&1 &
AUTH_PID=$!
echo "Auth Service started with PID: $AUTH_PID"

# Wait a bit before starting next service
sleep 5

# Start Discussion Service in background
echo "[2/3] Starting Discussion Service (port 8082)..."
cd /app/backend-java/discussion-service
java -jar target/discussion-service-1.0.0.jar > /tmp/discussion-service.log 2>&1 &
DISCUSSION_PID=$!
echo "Discussion Service started with PID: $DISCUSSION_PID"

# Wait a bit before starting next service
sleep 5

# Start Interaction Service in background
echo "[3/3] Starting Interaction Service (port 8083)..."
cd /app/backend-java/interaction-service
java -jar target/interaction-service-1.0.0.jar > /tmp/interaction-service.log 2>&1 &
INTERACTION_PID=$!
echo "Interaction Service started with PID: $INTERACTION_PID"

echo ""
echo "========================================"
echo "  All services started successfully!  "
echo "========================================"
echo ""
echo "Service URLs:"
echo "  - Auth Service:        http://localhost:8081/api/auth"
echo "  - Discussion Service:  http://localhost:8082/api/discussion"
echo "  - Interaction Service: http://localhost:8083/api/interaction"
echo ""
echo "Process IDs:"
echo "  - Auth Service:        $AUTH_PID"
echo "  - Discussion Service:  $DISCUSSION_PID"
echo "  - Interaction Service: $INTERACTION_PID"
echo ""
echo "Log files:"
echo "  - Auth Service:        /tmp/auth-service.log"
echo "  - Discussion Service:  /tmp/discussion-service.log"
echo "  - Interaction Service: /tmp/interaction-service.log"
echo ""
echo "To check service status:"
echo "  tail -f /tmp/auth-service.log"
echo "  tail -f /tmp/discussion-service.log"
echo "  tail -f /tmp/interaction-service.log"
echo ""
echo "To stop services:"
echo "  kill $AUTH_PID $DISCUSSION_PID $INTERACTION_PID"
echo ""

# Keep script running
echo "Press Ctrl+C to stop all services"
wait
