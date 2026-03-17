# DoConnect Backend - Complete Package

## 📦 Package Contents

This zip file contains the complete DoConnect Discussion Platform backend implementation with Spring Boot microservices.

### 🏗️ Structure

```
backend-java/
│
├── auth-service/                    # Authentication Service (Port 8081)
│   ├── src/main/java/              # Java source code
│   ├── src/main/resources/         # Configuration files
│   ├── pom.xml                     # Maven configuration
│   └── target/                     # Built JAR file (if included)
│
├── discussion-service/              # Discussion Service (Port 8082)
│   ├── src/main/java/              # Java source code
│   ├── src/main/resources/         # Configuration files
│   ├── pom.xml                     # Maven configuration
│   └── target/                     # Built JAR file (if included)
│
├── interaction-service/             # Interaction Service (Port 8083)
│   ├── src/main/java/              # Java source code
│   ├── src/main/resources/         # Configuration files
│   ├── pom.xml                     # Maven configuration
│   └── target/                     # Built JAR file (if included)
│
├── start-all-services.sh           # Start all services at once
├── start-auth-service.sh           # Start auth service
├── start-discussion-service.sh     # Start discussion service
├── start-interaction-service.sh    # Start interaction service
├── API_DOCUMENTATION.md            # Complete API documentation
└── QUICK_START.md                  # Quick start guide
```

---

## 🚀 Quick Start

### Prerequisites

- Java 17 or higher
- Maven 3.8+
- MySQL/MariaDB

### Step 1: Extract the Archive

```bash
unzip doconnect-backend-complete.zip
cd backend-java
```

### Step 2: Setup MySQL

```bash
# Start MySQL
sudo service mysql start
# or
sudo service mariadb start

# Create databases
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS doconnect_auth;
CREATE DATABASE IF NOT EXISTS doconnect_discussion;
CREATE DATABASE IF NOT EXISTS doconnect_interaction;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
```

### Step 3: Build All Services

```bash
# Build Auth Service
cd auth-service
mvn clean package -DskipTests
cd ..

# Build Discussion Service
cd discussion-service
mvn clean package -DskipTests
cd ..

# Build Interaction Service
cd interaction-service
mvn clean package -DskipTests
cd ..
```

### Step 4: Start Services

**Option A: Start all at once**
```bash
chmod +x *.sh
./start-all-services.sh
```

**Option B: Start individually in separate terminals**

Terminal 1:
```bash
cd auth-service
java -jar target/auth-service-1.0.0.jar
```

Terminal 2:
```bash
cd discussion-service
java -jar target/discussion-service-1.0.0.jar
```

Terminal 3:
```bash
cd interaction-service
java -jar target/interaction-service-1.0.0.jar
```

### Step 5: Test the Services

```bash
# Health checks
curl http://localhost:8081/api/auth/health
curl http://localhost:8082/api/discussion/questions/health
curl http://localhost:8083/api/interaction/messages/health

# Register a user
curl -X POST http://localhost:8081/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","email":"test@example.com","password":"password123"}'
```

---

## 📚 Documentation

- **API_DOCUMENTATION.md** - Complete API reference with all endpoints
- **QUICK_START.md** - Detailed setup and troubleshooting guide

---

## 🎯 Services Overview

### 1. Auth Service (Port 8081)
- User registration and login
- JWT token generation
- Password encryption
- Admin user management
- Role-based access control

**Base URL:** `http://localhost:8081/api/auth`

### 2. Discussion Service (Port 8082)
- Questions CRUD operations
- Answers management
- Likes and comments
- Search functionality
- Admin approval workflows

**Base URL:** `http://localhost:8082/api/discussion`

### 3. Interaction Service (Port 8083)
- Chat/messaging between users
- Notification system
- Read/unread tracking
- Conversation history

**Base URL:** `http://localhost:8083/api/interaction`

---

## 🔧 Configuration

Each service has its own `application.properties` file in `src/main/resources/`:

### Database Configuration
- Auth Service: `doconnect_auth`
- Discussion Service: `doconnect_discussion`
- Interaction Service: `doconnect_interaction`

### Default Ports
- Auth Service: 8081
- Discussion Service: 8082
- Interaction Service: 8083

---

## 🐛 Troubleshooting

### MySQL Connection Issues

1. Verify MySQL is running:
```bash
sudo service mysql status
```

2. Check MySQL credentials in `application.properties`

3. Grant proper permissions:
```bash
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES;"
```

### Port Already in Use

```bash
# Find process using port
lsof -i :8081

# Kill the process
kill -9 <PID>
```

### Build Failures

```bash
# Clean Maven cache
mvn clean

# Rebuild with verbose output
mvn clean install -X
```

---

## 📊 Technology Stack

- **Framework:** Spring Boot 3.2.0
- **Language:** Java 17
- **Database:** MySQL/MariaDB
- **Security:** Spring Security + JWT
- **ORM:** Spring Data JPA / Hibernate
- **Build Tool:** Maven 3.8.7

---

## 🎓 API Endpoints Summary

### Auth Service (7 endpoints)
- POST `/register` - User registration
- POST `/login` - User login
- GET `/profile` - Get user profile
- GET `/admin/users` - Get all users
- PUT `/admin/users/{id}/activate` - Activate user
- PUT `/admin/users/{id}/deactivate` - Deactivate user
- GET `/health` - Health check

### Discussion Service (28 endpoints)
- Questions: 11 endpoints (CRUD + search + approval)
- Answers: 7 endpoints (CRUD + approval)
- Likes: 5 endpoints (add, remove, count)
- Comments: 5 endpoints (CRUD + count)

### Interaction Service (20 endpoints)
- Messages: 10 endpoints (chat, conversations, read status)
- Notifications: 10 endpoints (create, read, types)

---

## 📝 License

Educational project for DoConnect Capstone.

---

## 📞 Support

For detailed information, refer to:
- `API_DOCUMENTATION.md` - Complete API reference
- `QUICK_START.md` - Setup and troubleshooting guide

---

**Built with ❤️ using Spring Boot**
