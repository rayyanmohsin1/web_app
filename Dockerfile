# Use an official Maven image to build the app
FROM maven:3.8.4-jdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Use a smaller JDK base image to run the app
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/WebApp-1.0-SNAPSHOT.jar /app/your-app.jar
ENTRYPOINT ["java", "-jar", "/app/your-app.jar"]
