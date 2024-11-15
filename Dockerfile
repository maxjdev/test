# BUILD
FROM maven:3.9-eclipse-temurin-17-alpine AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn install

# PACKAGE
FROM eclipse-temurin:17-jre-alpine AS runtime

WORKDIR /app

COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE ${APP_PORT}

CMD ["java", "-Dspring.profiles.active=${SPRING_PROFILE_PROD}", "-jar", "app.jar"]