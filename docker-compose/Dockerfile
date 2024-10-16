FROM apache/hive:3.1.3

ENV HIVE_HOME /opt/hive
ENV HADOOP_HOME /opt/hadoop
ENV PATH $HIVE_HOME/bin:$HADOOP_HOME/bin:$PATH

WORKDIR /opt/hive

RUN apt-get update && apt-get install curl -y && \
    curl -o /opt/hive/lib/postgresql-42.7.3.jar https://jdbc.postgresql.org/download/postgresql-42.2.3.jar && \
    curl -o /opt/hive/lib/aws-java-sdk-bundle-1.12.648.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.648/aws-java-sdk-bundle-1.12.648.jar && \
    curl -o /opt/hadoop/lib/hadoop-aws-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.6/hadoop-aws-3.3.6.jar

EXPOSE 9083

COPY ./metastore/hive-site.xml /opt/hive/conf/hive-site.xml

ENTRYPOINT ["hive", "--skiphadoopversion", "--skiphbasecp", "--service", "metastore"]
