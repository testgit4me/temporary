FROM tomcat:9-jdk11
LABEL "Author"="DevOps Engineer"
RUN apt update && apt install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package
WORKDIR /usr/local/tomcat
RUN cp boxfuse-sample-java-war-hello/target/hello-1.0.war webapps/ROOT.war
EXPOSE 8080