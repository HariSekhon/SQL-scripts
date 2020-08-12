SQL Scripts
===========

[![PostgreSQL](https://img.shields.io/badge/SQL-PostreSQL-336791?logo=postgresql)](https://www.postgresql.org/)
[![MySQL](https://img.shields.io/badge/SQL-MySQL-4479A1?logo=mysql)](https://www.mysql.com/)
[![MariaDB](https://img.shields.io/badge/SQL-MariaDB-003545?logo=mariadb)](https://mariadb.org/)
[![AWS Athena](https://img.shields.io/badge/SQL-AWS%20Athena-232F3E?logo=amazon%20aws)](https://aws.amazon.com/athena/)
[![Google BigQuery](https://img.shields.io/badge/SQL-Google%20BigQuery-4285F4?logo=google%20cloud)](https://cloud.google.com/bigquery)

[![Travis CI](https://img.shields.io/travis/harisekhon/sql-scripts/master?logo=travis&label=Travis)](https://travis-ci.org/HariSekhon/SQL-scripts)
[![Lines of Code](https://img.shields.io/badge/lines%20of%20code-3.8k-lightgrey?logo=codecademy)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/HariSekhon/SQL-scripts?logo=github)](https://github.com/HariSekhon/SQL-scripts/commits/master)

[![Linux](https://img.shields.io/badge/OS-Linux-blue?logo=linux)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![Mac](https://img.shields.io/badge/OS-Mac-blue?logo=apple)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-blue?logo=github)](https://github.com/HariSekhon/SQL-scripts)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-blue?logo=gitlab)](https://gitlab.com/HariSekhon/SQL-scripts)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-blue?logo=bitbucket)](https://bitbucket.org/HariSekhon/SQL-scripts)
[![CI Builds Overview](https://img.shields.io/badge/CI%20Builds-Overview%20Page-blue?logo=circleci)](https://bitbucket.org/HariSekhon/devops-bash-tools/src/master/STATUS.md)

Useful SQL scripts, split from [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools), for which this is now a submodule.

Hari Sekhon

Cloud & Big Data Contractor, United Kingdom

[![My LinkedIn](https://img.shields.io/badge/LinkedIn%20Profile-HariSekhon-blue?logo=linkedin)](https://www.linkedin.com/in/harisekhon/)
###### (you're welcome to connect with me on LinkedIn)

### Inventory

- `aws_athena_cloudtrail_ddl.sql` - [AWS Athena](https://aws.amazon.com/athena/) DDL to setup up integration to query [CloudTrail](https://aws.amazon.com/cloudtrail/) logs from Athena
- `bigquery_billing_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) billing queries for [GCP](https://cloud.google.com/) services eg. highest cost services, most used GCP products, recent charges etc.
- `mysql_*.sql` - [MySQL](https://www.mysql.com/) / [MariaDB](https://mariadb.org/) queries for DBA investigating + performance tuning
  - tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.x
  - `mysql_info.sql` - summary overview, useful to debug your `mysql.user` table auth effects (intended `USER()` vs actual `CURRENT_USER()`)
- `postgres_*.sql` - [PostgreSQL](https://www.postgresql.org/) queries for DBA investigating + performance tuning
  - tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x
  - [postgres_info.sql](https://github.com/HariSekhon/SQL-scripts/blob/master/postgres_info.sql) - big summary overview, recommend you start here

You can quickly test the PostgreSQL / MySQL scripts using `postgres.sh` / `mysqld.sh` / `mariadb.sh` in the [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools) repo, which boots a docker container and drops in to `mysql` / `psql` shell with this directory mounted at `/sql` and used as `$PWD` for fast easy sourcing eg.

postgres:
```
\i /sql/postgres_query_times.sql
```

mysql:
```
source /sql/mysql_sessions.sql
```

or just

```
\i postgres_query_times.sql
```

```
\. mysql_sessions.sql
```

since the `$PWD` is set to `/sql` for convenience.


#### See Also:

- [psql.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/psql.sh) - quickly connect to PostgreSQL with command line options auto-inferred from environment variables
- [mysql.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysql.sh) - quickly connect to MySQL / MariaDB with command line options auto-inferred from environment variables
- [postgres.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/postgres.sh) - one-touch PostgreSQL, boots docker container and drops you in to `psql` shell. Version can be given as an argument
- [mysqld.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysqld.sh) / [mariadb.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mariadb.sh) - one-touch MySQL / MariaDB, boots docker container and drops you in to `mysql` shell. Version can be given as an argument
- [sqlcase.pl](https://github.com/HariSekhon/DevOps-Perl-tools/blob/master/sqlcase.pl) - autocases your SQL code
  - I use this a lot and call it via hotkey configured in my [.vimrc](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/.vimrc)
  - there are `*case.pl` specializations for most of the major RDBMS and distributed SQL systems, even several NoSQL systems, using each one's language specific keywords

* [DevOps Bash Tools](https://github.com/harisekhon/devops-bash-tools) - 300+ DevOps Bash Scripts, Advanced `.bashrc`, `.vimrc`, `.screenrc`, `.tmux.conf`, CI configs & Utility Code Library - AWS, GCP, Kubernetes, Kafka, Docker, Hadoop, SQL, Athena, BigQuery, Hive, Impala, PostgreSQL, MySQL, LDAP, Spotify API & MP3 tools, Git, Code & build linting, package management for Linux / Mac / Python / Perl / Ruby / NodeJS / Golang, and lots more random goodies

* [DevOps Python Tools](https://github.com/harisekhon/devops-python-tools) - 80+ DevOps CLI tools for AWS, Hadoop, HBase, Spark, Log Anonymizer, Ambari Blueprints, AWS CloudFormation, Linux, Docker, Spark Data Converters & Validators (Avro / Parquet / JSON / CSV / INI / XML / YAML), Elasticsearch, Solr, Travis CI, Pig, IPython

* [The Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - 450+ programs for Nagios monitoring your Hadoop & NoSQL clusters. Covers every Hadoop vendor's management API and every major NoSQL technology (HBase, Cassandra, MongoDB, Elasticsearch, Solr, Riak, Redis etc.) as well as message queues (Kafka, RabbitMQ), continuous integration (Jenkins, Travis CI) and traditional infrastructure (SSL, Whois, DNS, Linux)

* [DevOps Perl Tools](https://github.com/harisekhon/perl-tools) - 25+ DevOps CLI tools for Hadoop, HDFS, Hive, Solr/SolrCloud CLI, Log Anonymizer, Nginx stats & HTTP(S) URL watchers for load balanced web farms, Dockerfiles & SQL ReCaser (MySQL, PostgreSQL, AWS Redshift, Snowflake, Apache Drill, Hive, Impala, Cassandra CQL, Microsoft SQL Server, Oracle, Couchbase N1QL, Dockerfiles, Pig Latin, Neo4j, InfluxDB), Ambari FreeIPA Kerberos, Datameer, Linux...

* [HAProxy-configs](https://github.com/harisekhon/haproxy-configs) - 80+ HAProxy Configs for Hadoop, Big Data, NoSQL, Docker, Elasticsearch, SolrCloud, HBase, Cloudera, Hortonworks, MapR, MySQL, PostgreSQL, Apache Drill, Hive, Presto, Impala, ZooKeeper, OpenTSDB, InfluxDB, Prometheus, Kibana, Graphite, SSH, RabbitMQ, Redis, Riak, Rancher etc.

* [Dockerfiles](https://github.com/HariSekhon/Dockerfiles) - 50+ DockerHub public images for Docker & Kubernetes - Hadoop, Kafka, ZooKeeper, HBase, Cassandra, Solr, SolrCloud, Presto, Apache Drill, Nifi, Spark, Mesos, Consul, Riak, OpenTSDB, Jython, Advanced Nagios Plugins & DevOps Tools repos on Alpine, CentOS, Debian, Fedora, Ubuntu, Superset, H2O, Serf, Alluxio / Tachyon, FakeS3
