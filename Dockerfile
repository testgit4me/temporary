FROM maven:3-openjdk-8 as BUILD_IMAGE
RUN apt update
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package

FROM tomcat:jre8-alpine
RUN  rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=BUILD_IMAGE /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/ROOT.war

# docker run -it maven:3-openjdk-8 bash



