FROM centos:7
ENV JAVA_HOME /opt/jdk1.8.0_191
ENV M2_HOME /opt/apache-maven-3.3.9
RUN yum install -y wget && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz && \
    tar xzf jdk-8u191-linux-x64.tar.gz -C /opt/ && \
    alternatives --install /usr/bin/java java /opt/jdk1.8.0_191/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_191/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_191/bin/javac 2 && \
    alternatives --set jar /opt/jdk1.8.0_191/bin/jar && \
    alternatives --set javac /opt/jdk1.8.0_191/bin/javac && \
    wget --no-check-certificate -c http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xzf apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
    alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.9/bin/mvn 2 && \
    rm -f jdk-8u191-linux-x64.tar.gz apache-maven-3.3.9-bin.tar.gz && \
    yum clean all && \
    rm -rf /var/cache/yum
CMD ["mvn"]
