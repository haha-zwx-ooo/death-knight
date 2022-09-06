FROM openjdk:8-jre-slim
MAINTAINER zhangwenxu

RUN apt-get update
RUN apt-get -y install inetutils-ping
RUN apt-get -y install telnet

ENV PARAMS=""
ENV JAVA_OPTS='-Xmx2048M -Xms2048M -Xmn1024M -XX:MaxMetaspaceSize=192M -XX:MetaspaceSize=192M -XX:+HeapDumpOnOutOfMemoryError'
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD target/x.jar /app.jar

ENTRYPOINT ["sh","-c","java -jar $JAVA_OPTS /app.jar $PARAMS"]
