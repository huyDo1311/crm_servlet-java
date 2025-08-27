# Stage 1: Build với Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Chạy với Tomcat
FROM tomcat:10.1-jdk17
COPY --from=build /app/target/crm_app.war /usr/local/tomcat/webapps/crm_app.war
EXPOSE 8080
