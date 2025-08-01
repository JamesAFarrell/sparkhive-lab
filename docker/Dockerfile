# Start from the Jupyter PySpark notebook image with Spark 3.5.0 pre-installed
FROM jupyter/pyspark-notebook:spark-3.5.0

# Switch to root to install system-level packages and dependencies
USER root

# Install Delta Lake Python API (delta-spark) for PySpark
RUN pip install --no-cache-dir delta-spark==3.2.0

# Create Spark config directory if needed
RUN mkdir -p /usr/local/spark/jars

# Download the needed jars and copy them to Spark jars folder
RUN curl -L -o /usr/local/spark/jars/delta-spark_2.12-3.2.0.jar https://repo1.maven.org/maven2/io/delta/delta-spark_2.12/3.2.0/delta-spark_2.12-3.2.0.jar && \
    curl -L -o /usr/local/spark/jars/delta-storage-3.2.0.jar https://repo1.maven.org/maven2/io/delta/delta-storage/3.2.0/delta-storage-3.2.0.jar && \
    curl -L -o /usr/local/spark/jars/hive-metastore-3.1.3.jar https://repo1.maven.org/maven2/org/apache/hive/hive-metastore/3.1.3/hive-metastore-3.1.3.jar && \
    curl -L -o /usr/local/spark/jars/hive-exec-3.1.3.jar https://repo1.maven.org/maven2/org/apache/hive/hive-exec/3.1.3/hive-exec-3.1.3.jar
    
# Download and install MySQL JDBC driver for Hive Metastore connectivity
RUN curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.0.33.tar.gz \
    | tar xz && \
    cp mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar /usr/local/spark/jars/ && \
    rm -rf mysql-connector-j-8.0.33

# Create Spark config directory for mounting spark-defaults.conf
RUN mkdir -p /usr/local/spark/conf

# Pre-download Delta Lake and Hive JARs during build to cache in image and avoid runtime download delays
RUN spark-submit --packages io.delta:delta-spark_2.12:3.2.0,org.apache.hive:hive-metastore:3.1.3,org.apache.hive:hive-exec:3.1.3 --version

# Set PySpark to start the shell without adding extra packages
ENV PYSPARK_SUBMIT_ARGS="pyspark-shell"

# Switch back to the default Jupyter notebook user
USER $NB_UID
