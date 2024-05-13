# hive-docker-macos-arm
A minimal setup to run hive+postgres-metastore on MacOS arm machines

Inspired from [Apache Hive on Docker](https://hshirodkar.medium.com/apache-hive-on-docker-4d7280ac6f8e) blog post.

## Installation

1. Download and install [Docker for MacOS](https://docs.docker.com/desktop/install/mac-install/)
2. Clone this repo in a local directory
3. Run `docker-compose up`

## Hosts

### Hadoop
Access Hadoop UI on ' http://localhost:9870 '

### Datanode
Access Datanode UI on ' http://localhost:9864 '

### Spark
Access Spark Master UI on ' http://localhost:8080 '

### spark-worker-1
Access spark worker 1 on ' http://localhost:8081 '

### spark-worker-2
Access spark worker 2 UI on ' http://localhost:8082 '

### Jupyter
Access Jupyter UI on ' http://localhost:8888 '

### Airflow
Airflow Webserver, monitoring and managing workflows ' http://localhost:8083 ' 

### Flower
Flower, monitoring Celery clusters. ' http://localhost:5555/ '

## Running the example

1. Open a shell in the hive server

```
$ docker exec -it hive-server /bin/bash
```

2. Create example table structure
```
root@dc86b2b9e566:/opt# cd /employee
root@dc86b2b9e566:/employee# hive -f employee_table.hql
```

3. Inject CSV data to HDFS
```
root@dc86b2b9e566:/employee# hadoop fs -put employee.csv hdfs://namenode:8020/user/hive/warehouse/testdb.db/employee
```

4. Query some data
```
root@df1ac619536c:/employee# hive

hive> show databases;
OK
default
testdb
Time taken: 2.363 seconds, Fetched: 2 row(s)

hive> use testdb;
OK
Time taken: 0.085 seconds

hive> select * from employee;
OK
1 Rudolf Bardin 30 cashier 100 New York 40000 5
2 Rob Trask 22 driver 100 New York 50000 4
3 Madie Nakamura 20 janitor 100 New York 30000 4
4 Alesha Huntley 40 cashier 101 Los Angeles 40000 10
5 Iva Moose 50 cashier 102 Phoenix 50000 20Time taken: 4.237 seconds, Fetched: 5 row(s)
```

`pip install pandas==1.3.5`

Write into HDFS: ' hdfs://namenode:8020/ ' 


## To do
- [ ] resource manager + history, nodemanager
- [ ] save jupyter files and dir
- [ ] change version of pandas pandas==1.3.5
- [ ] install kafka!