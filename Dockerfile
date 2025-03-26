FROM openjdk:8-jdk-alpine

VOLUME /tmp

ARG JAR_FILE=shop-1.0.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8083

ENTRYPOINT ["java", "-jar", "/app.jar"]
