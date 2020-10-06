FROM openjdk:13-jdk-alpine
LABEL maintainer="Lehlogonolo Masubelele"
ARG JAR_FILE=target/*.jar


# Running applications with user privileges helps to mitigate some risks
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring


EXPOSE 8080
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]