#centos7-java-mvn

Docker image based on CentOS 7, with installed and configured Oracle JDK 1.8u121, Maven and Tomcat 9

To run an image with Tomcat use next command:
$ docker run -it --rm docker-centos-java-mvn
If you need access outside the host, on port 8888:
$ docker run -it --rm -p 8888:8080 docker-centos-java-mvn

Basicaly this image has made as basement for Java projects.
Conception is clear, use an image as basement for custom image, copy sources into it, compile them and deploy in installed tomcat, that all.
