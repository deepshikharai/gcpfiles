FROM alpine/git as clone
ARG url
WORKDIR /app
RUN git clone ${url}

FROM maven:3.5-jdk-8-alpine as build
ARG path
ARG folder
WORKDIR /app
COPY --from=clone /app/${path} /app
CMD mvn install test -Dmaven.test.failure.ignore=true
#RUN mvn clean test
#RUN mkdir /app/${folder}
#CMD mvn test -Dmaven.test.failure.ignore=true
#CMD cp -R target/surefire-reports /app/${folder}
#RUN ls -al
# -Dmaven.test.failure.ignore=true -e && export my_folder=report_$(date +%Y%m%d_%H%M%S) && mkdir /data/${my_folder} && cp -R /app/target/surefire-reports /data/${my_folder} && echo Reports stored in ${my_folder}"]
#CMD 
