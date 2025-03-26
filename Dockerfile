



FROM openjdk:8-jdk-alpine
COPY --from=builder shop-1.0.jar /app.jar
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "/app.jar"]
