# Server Configuration
server.port=8081
server.servlet.context-path=/api/auth

# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/doconnect_auth?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
spring.jpa.properties.hibernate.format_sql=true

# JWT Configuration
jwt.secret=doconnect-secret-key-for-jwt-authentication-very-long-secret-key-2025
jwt.expiration=86400000

# Logging
logging.level.com.doconnect=DEBUG
logging.level.org.springframework.security=DEBUG