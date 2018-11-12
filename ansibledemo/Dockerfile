FROM alpine/git as clone
ARG url
WORKDIR /app
RUN git clone ${url}

FROM maven:3.5-jdk-8-alpine as build
ARG path
WORKDIR /app
COPY --from=clone /app/${path} /app
RUN mvn clean install

FROM openjdk:8-jre-alpine
ARG artifactid
ARG version
ENV artifact ${artifactid}-${version}-SNAPSHOT-jar-with-dependencies.jar
WORKDIR /app
COPY --from=build /app/target/ /app
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar /app/${artifact}"]
