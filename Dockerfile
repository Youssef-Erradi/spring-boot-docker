#First stage : MAVEN build
FROM maven:3.8-eclipse-temurin-17 AS MAVEN

COPY ./ ./

RUN mvn clean package

#Second stage : Java 11 build
FROM eclipse-temurin:17-jre-alpine

COPY --from=MAVEN /spring-boot-docker/target/spring-boot-docker.jar /spring-boot-docker.jar

CMD ["java", "-jar", "/spring-boot-docker.jar"]