
#!/bin/sh

export HADOOP_HOME=/opt/hadoop-3.3.6
export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.367.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.3.6.jar
export JAVA_HOME=/usr/local/openjdk-8
export METASTORE_DB_HOSTNAME=${METASTORE_DB_HOSTNAME:-localhost}
export HMS_HOME=/opt/apache-hive-metastore-3.1.3-bin

POSTGRES='postgres'


if [ "${METASTORE_TYPE}" = "${POSTGRES}" ]; then
  echo "Waiting for database on ${METASTORE_DB_HOSTNAME} to launch on 5432 ..."
  while ! nc -z ${METASTORE_DB_HOSTNAME} 5432; do
    sleep 1
  done

  echo "Database on ${METASTORE_DB_HOSTNAME}:5432 started"
  echo "Init apache hive metastore on ${METASTORE_DB_HOSTNAME}:5432"

  $HMS_HOME/bin/schematool -initSchema -dbType postgres
  $HMS_HOME/bin/start-metastore
fi
