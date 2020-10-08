FROM openjdk:13-jdk-alpine
LABEL maintainer="Lehlogonolo Masubelele"
ARG JAR_FILE=release/*.jar

WORKDIR /opt/

# Running applications with user privileges helps to mitigate some risks
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring


EXPOSE 8080
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/opt/app.jar"]
