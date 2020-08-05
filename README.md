SQL Scripts
===========

Reusable SQL scripts, split from [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools), for which this is now a submodule.

- `aws_athena_cloudtrail_ddl.sql` - [AWS Athena](https://aws.amazon.com/athena/) DDL to setup up integration to query [CloudTrail](https://aws.amazon.com/cloudtrail/) logs from Athena
- `bigquery_billing_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) billing queries for [GCP](https://cloud.google.com/) services eg. highest cost services, most used GCP products, recent charges etc.
- `postgres_*.sql` - [PostgreSQL](https://www.postgresql.org/) queries for DBA investigating + performance tuning

You can quickly test these PostgreSQL scripts using `postgres.sh` in the [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools) repo, which boots a docker container and drops in to `psql` shell with this directory mounted at `/sql` for easy sourcing eg. `\i /sql/postgres_query_times.sql`

#### See Also:

- `sqlcase.pl` in the [DevOps Perl tools](https://github.com/harisekhon/devops-perl-tools) repo - autocases your SQL code
  - I use this a lot and call it via hotkey configured in my [.vimrc](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/.vimrc)
  - there are specializations for most of the major SQL, RDBMS and distributed SQL systems using their specific language keywords

* [DevOps Bash Tools](https://github.com/harisekhon/devops-bash-tools) - 300+ DevOps Bash Scripts, Advanced `.bashrc`, `.vimrc`, `.screenrc`, `.tmux.conf`, CI configs & Utility Code Library - AWS, GCP, Kubernetes, Kafka, Docker, Hadoop, SQL, Athena, BigQuery, Hive, Impala, PostgreSQL, MySQL, LDAP, Spotify API & MP3 tools, Git, Code & build linting, package management for Linux / Mac / Python / Perl / Ruby / NodeJS / Golang, and lots more random goodies

* [DevOps Python Tools](https://github.com/harisekhon/devops-python-tools) - 80+ DevOps CLI tools for AWS, Hadoop, HBase, Spark, Log Anonymizer, Ambari Blueprints, AWS CloudFormation, Linux, Docker, Spark Data Converters & Validators (Avro / Parquet / JSON / CSV / INI / XML / YAML), Elasticsearch, Solr, Travis CI, Pig, IPython

* [The Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - 450+ programs for Nagios monitoring your Hadoop & NoSQL clusters. Covers every Hadoop vendor's management API and every major NoSQL technology (HBase, Cassandra, MongoDB, Elasticsearch, Solr, Riak, Redis etc.) as well as message queues (Kafka, RabbitMQ), continuous integration (Jenkins, Travis CI) and traditional infrastructure (SSL, Whois, DNS, Linux)

* [DevOps Perl Tools](https://github.com/harisekhon/perl-tools) - 25+ DevOps CLI tools for Hadoop, HDFS, Hive, Solr/SolrCloud CLI, Log Anonymizer, Nginx stats & HTTP(S) URL watchers for load balanced web farms, Dockerfiles & SQL ReCaser (MySQL, PostgreSQL, AWS Redshift, Snowflake, Apache Drill, Hive, Impala, Cassandra CQL, Microsoft SQL Server, Oracle, Couchbase N1QL, Dockerfiles, Pig Latin, Neo4j, InfluxDB), Ambari FreeIPA Kerberos, Datameer, Linux...

* [HAProxy-configs](https://github.com/harisekhon/haproxy-configs) - 80+ HAProxy Configs for Hadoop, Big Data, NoSQL, Docker, Elasticsearch, SolrCloud, HBase, Cloudera, Hortonworks, MapR, MySQL, PostgreSQL, Apache Drill, Hive, Presto, Impala, ZooKeeper, OpenTSDB, InfluxDB, Prometheus, Kibana, Graphite, SSH, RabbitMQ, Redis, Riak, Rancher etc.

* [Dockerfiles](https://github.com/HariSekhon/Dockerfiles) - 50+ DockerHub public images for Docker & Kubernetes - Hadoop, Kafka, ZooKeeper, HBase, Cassandra, Solr, SolrCloud, Presto, Apache Drill, Nifi, Spark, Mesos, Consul, Riak, OpenTSDB, Jython, Advanced Nagios Plugins & DevOps Tools repos on Alpine, CentOS, Debian, Fedora, Ubuntu, Superset, H2O, Serf, Alluxio / Tachyon, FakeS3
