FROM alpine:latest
RUN apk update && apk add openjdk8 && apk add maven && apk add git
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz
RUN tar -xzvf apache-tomcat-8.5.41.tar.gz
RUN cp -rf apache-tomcat-8.5.41 /usr/local/tomcat
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package
RUN cp target/hello-1.0.war /usr/local/tomcat/webapps/boxfuse.war
WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["bin/catalina.sh" "run"]


# FROM tomcat:9-jdk11
# LABEL "Author"="DevOps Engineer"
# RUN apt update && apt install maven git -y
# RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
# RUN cd boxfuse-sample-java-war-hello && mvn package
# WORKDIR /usr/local/tomcat
# RUN cp boxfuse-sample-java-war-hello/target/hello-1.0.war webapps/ROOT.war
# EXPOSE 8080

# docker run -it maven:3-openjdk-8 bash

# FROM  maven:3-openjdk-8 as BUILD_IMAGE
# RUN apt update
# RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
# RUN cd boxfuse-sample-java-war-hello && mvn package

# FROM tomcat:jre8-alpine
# cp target/hello-1.0.war /usr/local/tomcat/webapps/hello.war