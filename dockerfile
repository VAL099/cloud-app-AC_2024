FROM openjdk:17

WORKDIR /app
# add here execution of gradlew.bat build
COPY build build
COPY src src

EXPOSE 80

CMD ["java", "-jar", "build/libs/cloud-app-0.0.1-SNAPSHOT.jar"]
