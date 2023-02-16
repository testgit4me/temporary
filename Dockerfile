FROM tomcat:8-jre11
LABEL "Author"="DevOps Engineer"
EXPOSE 8080
CMD ["catalina.sh", run]
# RUN apt update && apt install maven git -y
# RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
# RUN cd boxfuse-sample-java-war-hello && mvn package
