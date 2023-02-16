FROM tomcat:9-jdk11
# RUN apt update && apt install maven git -y
# RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
# RUN cd boxfuse-sample-java-war-hello && mvn package
EXPOSE 8080
CMD ["catalina.sh" "run"]