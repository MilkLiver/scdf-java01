#FROM docker.io/centos:7
#FROM 192.168.50.11/seyana/centos:7
FROM registry.access.redhat.com/ubi8/ubi
MAINTAINER milkliver
#ARG uid=0
#ARG gid=0
#USER 0

VOLUME /sys/fs/cgroup

RUN yum install -y java
RUN yum install -y curl
RUN yum install -y python3

RUN mkdir /testfiles
WORKDIR /testfiles

ADD ./scdf-task01.jar /testfiles/
ADD ./externalProgramFiles/* /testfiles/
RUN chmod 777 -Rf /testfiles

RUN mkdir /configs
ADD ./execution.properties /configs/execution.properties
RUN chmod 777 -Rf /configs/execution.properties


ENTRYPOINT ["/bin/java","-jar","-Dspring.config.location=/configs/execution.properties","/testfiles/scdf-task01.jar"]
#CMD ["/bin/java","-jar","-Dspring.config.location=/configs/execution.properties","/testfiles/scdf-task01.jar"]


# For Test
#CMD ["tail","-f","/dev/null"]
