FROM debian:jessie
MAINTAINER LWB

ENV MANIFOLDCF_VERSION 2.6
ENV CIFS_VERSION 1.3.18

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends \
    wget curl ca-certificates \
    openjdk-7-jre-headless \
    gzip && \
  	rm -rf /var/lib/apt/lists/*

RUN wget http://apache.mirror.rafal.ca/manifoldcf/apache-manifoldcf-${MANIFOLDCF_VERSION}/apache-manifoldcf-${MANIFOLDCF_VERSION}-bin.tar.gz && \
    wget http://jcifs.samba.org/src/jcifs-${CIFS_VERSION}.jar && \
    tar -xzvf apache-manifoldcf-${MANIFOLDCF_VERSION}-bin.tar.gz && \
    cp -R apache-manifoldcf-${MANIFOLDCF_VERSION} /usr/share/manifoldcf && \
    cp jcifs-${CIFS_VERSION}.jar /usr/share/manifoldcf/connector-lib-proprietary

EXPOSE 8345

WORKDIR /usr/share/manifoldcf/example

CMD ["java", "-jar", "start.jar"]