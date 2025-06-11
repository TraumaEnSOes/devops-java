#
# Build stage
#
FROM maven:3.8.6-openjdk-11-slim AS build
ARG VERSION=0.0.1-SNAPSHOT

COPY ./src /home/app/src
COPY ./pom.xml /home/app

WORKDIR /home/app

RUN mvn versions:set -DnewVersion=${VERSION}
RUN mvn install

#
# Package stage
#
FROM openjdk:11-jre-slim
ARG VERSION
COPY --from=build /home/app/target/spring-boot-2-hello-world-${VERSION}.jar /usr/local/lib/app.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]
