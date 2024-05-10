# Step 1: Use a Java image for building the project
FROM openjdk:17-slim AS builder

# Set the working directory in the Docker image
WORKDIR /app

# Copy the Gradle configuration files
COPY gradlew /app/
COPY gradle /app/gradle
COPY build.gradle.kts /app/
COPY settings.gradle.kts /app/

# Copy the source code
COPY src /app/src

# Grant execution rights on the Gradle wrapper
RUN chmod +x ./gradlew

# Build the project with the Gradle wrapper, skipping tests
RUN ./gradlew build -x test

# Step 2: Create a new stage for running the application using a JRE image
FROM openjdk:17-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the previous stage
COPY --from=builder /app/build/libs/rest-kafka-example-0.0.1-SNAPSHOT.jar /app/rest-kafka-example-0.0.1-SNAPSHOT.jar

# Define command to start the application
CMD ["java", "-jar", "/app/rest-kafka-example-0.0.1-SNAPSHOT.jar"]
