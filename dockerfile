FROM openjdk:17

WORKDIR /app
# add here execution of gradlew.bat build
COPY build build
COPY src src

EXPOSE 80

CMD ["java", "-jar", "build/libs/cloud-app-0.0.1-SNAPSHOT.jar"]
# Use OpenJDK 17 as the base image
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper and other necessary build files
COPY gradlew /app/
COPY gradlew.bat /app/
COPY gradle /app/gradle
COPY build.gradle.kts /app/
COPY settings.gradle.kts /app/

# Copy your source files into the container
COPY src /app/src

# Make sure the Gradle wrapper is executable
RUN chmod +x ./gradlew

# Execute the Gradle build
RUN ./gradlew build

# Expose port 80 to the outside
EXPOSE 80

# Command to run the application
CMD ["java", "-jar", "build/libs/cloud-app-0.0.1-SNAPSHOT.jar"]
