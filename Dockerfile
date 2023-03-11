FROM ubuntu:20.04
ENV JAVA_HOME=/uo1/middleware/jdk-11.0.1
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-9.0.71
ENV PATH=$PATH:$JAVA_HOME/bin:$TOMCAT_HOME/bin
RUN mkdir -p /uo1/middleware
WORKDIR /u01/middleware
ADD https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/11.0.18+10/openlogic-openjdk-jre-11.0.18+10-linux-x64.tar.gz
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar -xzvf openlogic-openjdk-jre-11.0.18+10-linux-x64.tar.gz .
RUN tar -xzvf apache-tomcat-9.0.71.tar.gz .
RUN rm -rf openlogic-openjdk-jre-11.0.18+10-linux-x64.tar.gz
RUN rm -rf apache-tomcat-9.0.71.tar.gz
COPY target/speed.tar apcache-tomcat-9.0.71/webapps
COPY ./run.sh .
CMD ["./run.sh"]
ENTRIPOINT ["tail","-f","dev/null"]