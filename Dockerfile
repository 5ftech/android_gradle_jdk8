FROM ubuntu:14.04

RUN mkdir -p /usr/share/java
WORKDIR /usr/share/java
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl

RUN wget http://wufan.oss-cn-qingdao.aliyuncs.com/server/jdk-8u11-linux-x64.tar.gz
RUN tar -zxvf jdk-8u11-linux-x64.tar.gz

ENV JAVA_HOME /usr/share/java/jdk1.8.0_11
ENV JRE_HOME /usr/share/java/jdk1.8.0_11/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH


RUN mkdir -p /usr/share/android
RUN mkdir -p /usr/share/src
WORKDIR /usr/share/android

RUN apt-get install -y unzip
RUN wget http://wufan.oss-cn-qingdao.aliyuncs.com/server/gradle-2.14.1-all.zip

RUN unzip gradle-2.14.1-all.zip
ENV GRADLE_HOME /usr/share/android/gradle-2.14.1
ENV PATH ${JAVA_HOME}/bin:${GRADLE_HOME}/bin:$PATH

RUN mkdir -p /Users/gthowe/Library/Android/sdk
RUN mkdir -p /root/.gradle/
WORKDIR /usr/share/src

ADD build.sh /root/

#安卓sdk路径 /Users/gthowe/Library/Android/sdk
#.gradle依赖库路径 /root/.gradle/
#源码路径 /usr/share/src

#执行命令
CMD ["/root/build.sh"]
