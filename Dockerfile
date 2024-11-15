# Etapa única para execução do .jar já compilado
FROM eclipse-temurin:17-jre-alpine AS runtime

WORKDIR /app

# Copia o arquivo .jar da pasta target diretamente para o contêiner
COPY target/*.jar /app/app.jar

EXPOSE ${APP_PORT}

CMD ["java", "-Dspring.profiles.active=${SPRING_PROFILE_PROD}", "-jar", "app.jar"]
