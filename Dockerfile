FROM centos:7
ENV JAVA_HOME /opt/jdk1.8.0_121
ENV M2_HOME /opt/apache-maven-3.3.9
ENV CATALINA_HOME /opt/apache-tomcat-9.0.0.M17
ENV PATH $CATALINA_HOME/bin:$PATH
RUN yum install -y wget && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz && \
    tar xzf jdk-8u121-linux-x64.tar.gz -C /opt/ && \
    alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_121/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_121/bin/javac 2 && \
    alternatives --set jar /opt/jdk1.8.0_121/bin/jar && \
    alternatives --set javac /opt/jdk1.8.0_121/bin/javac && \
    wget --no-check-certificate -c http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xzf apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
    alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.9/bin/mvn 2 && \
    wget --no-check-certificate -c http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz && \
    tar xzf apache-tomcat-9.0.0.M17.tar.gz -C /opt/ && \
    yum install -y git && \
    rm -f jdk-8u121-linux-x64.tar.gz apache-maven-3.3.9-bin.tar.gz apache-tomcat-9.0.0.M17.tar.gz
EXPOSE 8080
CMD ["catalina.sh", "run"]
