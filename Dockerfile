
FROM maven:3.8.6-openjdk-8 AS builder
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package


FROM openjdk:8-jdk-alpine
COPY --from=builder /app/target/shop-1.0.jar /app.jar
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "/app.jar"]
