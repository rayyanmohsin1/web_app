# Use a base image with JDK
FROM openjdk:11-jdk

# Set the working directory
WORKDIR /app

# Copy the Maven build output from the target directory to /app
COPY target/*.jar app.jar

# Expose the port your application will run on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
