# Usar a imagem base do Apache Hive 3.1.3
FROM apache/hive:3.1.3

# Definir variáveis de ambiente para configuração
ENV HIVE_HOME /opt/hive
ENV HADOOP_HOME /opt/hadoop
ENV PATH $HIVE_HOME/bin:$HADOOP_HOME/bin:$PATH

# Diretório de trabalho
WORKDIR /opt/hive

# Baixar as dependências necessárias
RUN apt-get update && apt-get install -y curl && \
    # Baixar o driver JDBC do PostgreSQL
    curl -o /opt/hive/lib/postgresql-42.7.4.jar https://jdbc.postgresql.org/download/postgresql-42.7.4.jar && \
    # Baixar o AWS SDK para integração com S3/MinIO
    curl -o /opt/hive/lib/aws-java-sdk-bundle-1.12.648.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.648/aws-java-sdk-bundle-1.12.648.jar && \
    # Baixar o hadoop-aws para integração com S3 via s3a
    curl -o /opt/hadoop/lib/hadoop-aws-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.6/hadoop-aws-3.3.6.jar

# Expor a porta do Hive Metastore
EXPOSE 9083

# Copiar o arquivo de configuração hive-site.xml (substitua pela localização correta do seu arquivo local)
COPY ./metastore/hive-site.xml /opt/hive/conf/hive-site.xml

# Definir o entrypoint para o metastore do Hive
ENTRYPOINT ["hive", "--skiphadoopversion", "--skiphbasecp", "--service", "metastore"]
