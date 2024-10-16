FROM openjdk:8-jre-slim-buster

WORKDIR /opt

ENV HADOOP_VERSION=3.2.0
ENV METASTORE_VERSION=3.1.3

RUN apt-get update && apt-get install -y netcat curl

ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
ENV HIVE_HOME=/opt/apache-hive-metastore-${METASTORE_VERSION}-bin

RUN curl -L https://repo1.maven.org/maven2/org/apache/hive/hive-standalone-metastore/${METASTORE_VERSION}/hive-standalone-metastore-${METASTORE_VERSION}-bin.tar.gz | tar zxf - && \
    curl -L https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar zxf - && \
    curl -L --output postgresql-42.7.4.jar https://jdbc.postgresql.org/download/postgresql-42.7.4.jar && \
    cp postgresql-42.4.0.jar ${HIVE_HOME}/lib/ && \
    rm -rf  postgresql-42.4.0.jar

COPY scripts/entrypoint.sh /entrypoint.sh

RUN groupadd -r hive --gid=1000 && \
    useradd -r -g hive --uid=1000 -d ${HIVE_HOME} hive && \
    chown hive:hive -R ${HIVE_HOME} && \
    chown hive:hive /entrypoint.sh && chmod +x /entrypoint.sh

USER hive
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]