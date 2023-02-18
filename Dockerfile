FROM maven:3-openjdk-8 as BUILD_IMAGE
RUN apt update
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package

FROM tomcat:jre8-alpine
RUN  rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=BUILD_IMAGE /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/ROOT.war

# docker run -it maven:3-openjdk-8 bash




FROM alpine:latest
RUN apk update && apk add openjdk8
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz
RUN tar -xzvf apache-tomcat-8.5.41.tar.gz && rm -rf apache-tomcat-8.5.41.tar.gz && mv apache-tomcat-8.5.41 /usr/local/tomcat 
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=BUILD_SERVER /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/ROOT.war
WORKDIR /usr/local/tomcat
EXPOSE 8080
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh","run"]

