SQL Scripts
===========

[![PostgreSQL](https://img.shields.io/badge/SQL-PostreSQL-336791?logo=postgresql)](https://www.postgresql.org/)
[![MySQL](https://img.shields.io/badge/SQL-MySQL-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![MariaDB](https://img.shields.io/badge/SQL-MariaDB-003545?logo=mariadb)](https://mariadb.org/)
[![AWS Athena](https://img.shields.io/badge/SQL-AWS%20Athena-232F3E?logo=amazon%20aws)](https://aws.amazon.com/athena/)
[![Google BigQuery](https://img.shields.io/badge/SQL-Google%20BigQuery-4285F4?logo=google%20cloud)](https://cloud.google.com/bigquery)

[![Lines of Code](https://img.shields.io/badge/lines%20of%20code-5k-lightgrey?logo=codecademy)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![GitHub stars](https://img.shields.io/github/stars/HariSekhon/SQL-scripts?logo=github)](https://github.com/HariSekhon/SQL-scripts/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/HariSekhon/SQL-scripts?logo=github)](https://github.com/HariSekhon/SQL-scripts/network)
[![StarTrack](https://img.shields.io/badge/Star-Track-blue?logo=github)](https://seladb.github.io/StarTrack-js/#/preload?r=HariSekhon,Nagios-Plugins&r=HariSekhon,Dockerfiles&r=HariSekhon,DevOps-Python-tools&r=HariSekhon,DevOps-Perl-tools&r=HariSekhon,DevOps-Bash-tools&r=HariSekhon,HAProxy-configs&r=HariSekhon,SQL-scripts)
[![StarCharts](https://img.shields.io/badge/Star-Charts-blue?logo=github)](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/STARCHARTS.md)

[![Validation](https://github.com/HariSekhon/SQL-scripts/actions/workflows/validate.yaml/badge.svg)](https://github.com/HariSekhon/SQL-scripts/actions/workflows/validate.yaml)
[![Semgrep](https://github.com/HariSekhon/SQL-scripts/actions/workflows/semgrep.yaml/badge.svg)](https://github.com/HariSekhon/SQL-scripts/actions/workflows/semgrep.yaml)
[![CI Builds Overview](https://img.shields.io/badge/CI%20Builds-Overview%20Page-blue?logo=circleci)](https://bitbucket.org/HariSekhon/devops-bash-tools/src/master/STATUS.md)
[![Travis CI](https://img.shields.io/badge/TravisCI-legacy-lightgrey?logo=travis&label=Travis%20CI)](https://github.com/HariSekhon/SQL-scripts/blob/master/.travis.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/HariSekhon/SQL-scripts?logo=github)](https://github.com/HariSekhon/SQL-scripts/commits/master)

[![Linux](https://img.shields.io/badge/OS-Linux-blue?logo=linux)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![Mac](https://img.shields.io/badge/OS-Mac-blue?logo=apple)](https://github.com/HariSekhon/SQL-scripts#SQL-Scripts)
[![Repo on Azure DevOps](https://img.shields.io/badge/repo-Azure%20DevOps-0078D7?logo=azure%20devops)](https://dev.azure.com/harisekhon/GitHub/_git/SQL-scripts)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-2088FF?logo=github)](https://github.com/HariSekhon/SQL-scripts)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-FCA121?logo=gitlab)](https://gitlab.com/HariSekhon/SQL-scripts)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-0052CC?logo=bitbucket)](https://bitbucket.org/HariSekhon/SQL-scripts)

[git.io/SQL](https://git.io/SQL)

Useful SQL scripts, split from [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools), for which this is now a submodule.

Hari Sekhon

Cloud & Big Data Contractor, United Kingdom

[![My LinkedIn](https://img.shields.io/badge/LinkedIn%20Profile-HariSekhon-blue?logo=linkedin)](https://www.linkedin.com/in/harisekhon/)
###### (you're welcome to connect with me on LinkedIn)

### Inventory

#### DevOps / DBA

- `aws_athena_cloudtrail_ddl.sql` - [AWS Athena](https://aws.amazon.com/athena/) DDL to setup up integration to query [CloudTrail](https://aws.amazon.com/cloudtrail/) logs from Athena
- `bigquery_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) scripts:
  - `bigquery_billing_*.sql` - billing queries for [GCP](https://cloud.google.com/) usage eg. highest cost services, most used GCP products, recent charges etc.
  - `bigquery_info_*.sql` - information schema queries for datasets, tables, columns, partitioning, clustering etc.
- `mysql_*.sql`:
  - [MySQL](https://www.mysql.com/) / [MariaDB](https://mariadb.org/) queries for DBA investigating + performance tuning
  - `mysql_info.sql` - summary overview, useful to debug your `mysql.user` table auth effects
    - (shows intended `USER()` vs actual `CURRENT_USER()`)
  - tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.x
- `postgres_*.sql`:
  - [PostgreSQL](https://www.postgresql.org/) queries for DBA investigating + performance tuning
  - [postgres_info.sql](https://github.com/HariSekhon/SQL-scripts/blob/master/postgres_info.sql) - big summary overview, recommend you start here
  - tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.x

#### Analytics

- `bigquery_*.sql` - [Google BigQuery](https://cloud.google.com/bigquery) scripts:
  - `bigquery_billing_*.sql` - billing queries for [GCP](https://cloud.google.com/) usage eg. highest cost services, most used GCP products, recent charges etc.
  - `bigquery_info_*.sql` - information schema queries for datasets, tables, columns, partitioning, clustering etc.
  - [analytics/](https://github.com/HariSekhon/SQL-scripts/tree/master/analytics)`bigquery_*.sql` - ecommerce queries and [BigQuery ML](https://cloud.google.com/bigquery-ml/docs/bigqueryml-intro) machine learning classification logistic regression models and purchasing predictions
  - for more [BigQuery](https://cloud.google.com/bigquery) examples, see [Data Engineering demos](https://github.com/GoogleCloudPlatform/training-data-analyst/tree/master/courses/data-engineering/demos)

#### DevOps SQL tooling

You can quickly test the PostgreSQL / MySQL scripts using `postgres.sh` / `mysqld.sh` / `mariadb.sh` in the [DevOps Bash tools](https://github.com/harisekhon/devops-bash-tools) repo, which boots a docker container and drops straight in to a `mysql` / `psql` shell with this directory mounted at `/sql` and used as `$PWD` for fast easy sourcing eg.

postgres:
```
\i /sql/postgres_query_times.sql
```
```
\i postgres_query_times.sql
```

mysql:
```
source /sql/mysql_sessions.sql
```
```
\. mysql_sessions.sql
```


#### Related scripts

- [.psqlrc](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/.psqlrc) - advanced PostgreSQL psql client config
- [psql.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/psql.sh) - quickly connect to PostgreSQL with command line switches inferred from environment variables
- [mysql.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysql.sh) - quickly connect to MySQL / MariaDB with command line switches inferred from environment variables
- [postgres.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/postgres.sh) - one-touch PostgreSQL, boots docker container and drops you in to `psql` shell. Version can be given as an argument
- [mysqld.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysqld.sh) / [mariadb.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mariadb.sh) - one-touch MySQL / MariaDB, boots docker container and drops you in to `mysql` shell. Version can be given as an argument
- [postgres_foreach_table.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/postgres_foreach_table.sh) / [mysql_foreach_table.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysql_foreach_table.sh) - execute templated SQL queries/statements against all or a subset of tables
- [postgres_tables_row_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/postgres_tables_row_counts.sh) / [mysql_tables_row_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/mysql_tables_row_counts.sh) - get row counts for all or a subset of tables
- [sqlcase.pl](https://github.com/HariSekhon/DevOps-Perl-tools/blob/master/sqlcase.pl) - autocases your SQL code
  - I use this a lot and call it via hotkey configured in my [.vimrc](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/.vimrc)
  - there are `*case.pl` specializations for most of the major RDBMS and distributed SQL systems, even several NoSQL systems, using each one's language specific keywords
- Hive & Impala SQL:
  - [beeline.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/beeline.sh) - quickly connect to Hive, auto-determines HiveServer2 address, Kerberos & SSL options, ZooKeeper quorum
  - [impala_shell.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_shell.sh) - quickly connect to Impala, auto-determines a Hadoop worker node address and Kerberos options (can use an environment variable for a [Load Balancer](https://github.com/HariSekhon/HAProxy-configs/blob/master/impala-jdbc.cfg) setup)
  - [hive_foreach_table.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/hive_foreach_table.sh) / [impala_foreach_table.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_foreach_table.sh) - execute templated SQL queries/statements against all or a subset of tables
  - [hive_tables_row_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/hive_tables_row_counts.sh) / [impala_tables_row_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_tables_row_counts.sh) - get row counts for all or a subset of tables
  - [hive_tables_column_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/hive_tables_column_counts.sh) / [impala_tables_column_counts.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_tables_column_counts.sh) - get the column counts for big tables in Hive / Impala
  - [hive_tables_metadata.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/hive_tables_metadata.sh) / [impala_tables_metadata.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_tables_metadata.sh) / [hive_tables_locations.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/hive_tables_locations.sh) / [impala_tables_locations.sh](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/impala_tables_locations.sh) - get Hive / Impala metadata for all or a subset of tables, eg. Location to determine where the external tables data is being stored (HDFS / S3 paths)

### See Also

- [DevOps Bash Tools](https://github.com/harisekhon/devops-bash-tools) - 700+ DevOps Bash Scripts, Advanced `.bashrc`, `.vimrc`, `.screenrc`, `.tmux.conf`, `.gitconfig`, CI configs & Utility Code Library - AWS, GCP, Kubernetes, Docker, Kafka, Hadoop, SQL, BigQuery, Hive, Impala, PostgreSQL, MySQL, LDAP, DockerHub, Jenkins, Spotify API & MP3 tools, Git tricks, GitHub API, GitLab API, BitBucket API, Code & build linting, package management for Linux / Mac / Python / Perl / Ruby / NodeJS / Golang, and lots more random goodies

- [Templates](https://github.com/HariSekhon/Templates) - dozens of Code & Config templates - AWS, GCP, Docker, Jenkins, Terraform, Vagrant, Puppet, Python, Bash, Go, Perl, Java, Scala, Groovy, Maven, SBT, Gradle, Make, GitHub Actions Workflows, CircleCI, Jenkinsfile, Makefile, Dockerfile, docker-compose.yml, M4 etc.

- [Kubernetes configs](https://github.com/HariSekhon/Kubernetes-configs) - Kubernetes YAML configs - Best Practices, Tips & Tricks are baked right into the templates for future deployments

- [DevOps Python Tools](https://github.com/harisekhon/devops-python-tools) - 80+ DevOps CLI tools for AWS, GCP, Hadoop, HBase, Spark, Log Anonymizer, Ambari Blueprints, AWS CloudFormation, Linux, Docker, Spark Data Converters & Validators (Avro / Parquet / JSON / CSV / INI / XML / YAML), Elasticsearch, Solr, Travis CI, Pig, IPython

- [The Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - 450+ programs for Nagios monitoring your Hadoop & NoSQL clusters. Covers every Hadoop vendor's management API and every major NoSQL technology (HBase, Cassandra, MongoDB, Elasticsearch, Solr, Riak, Redis etc.) as well as message queues (Kafka, RabbitMQ), continuous integration (Jenkins, Travis CI) and traditional infrastructure (SSL, Whois, DNS, Linux)

- [DevOps Perl Tools](https://github.com/harisekhon/perl-tools) - 25+ DevOps CLI tools for Hadoop, HDFS, Hive, Solr/SolrCloud CLI, Log Anonymizer, Nginx stats & HTTP(S) URL watchers for load balanced web farms, Dockerfiles & SQL ReCaser (MySQL, PostgreSQL, AWS Redshift, Snowflake, Apache Drill, Hive, Impala, Cassandra CQL, Microsoft SQL Server, Oracle, Couchbase N1QL, Dockerfiles, Pig Latin, Neo4j, InfluxDB), Ambari FreeIPA Kerberos, Datameer, Linux...

- [HAProxy Configs](https://github.com/HariSekhon/HAProxy-configs) - 80+ HAProxy Configs for Hadoop, Big Data, NoSQL, Docker, Elasticsearch, SolrCloud, HBase, Cloudera, Hortonworks, MapR, MySQL, PostgreSQL, Apache Drill, Hive, Presto, Impala, ZooKeeper, OpenTSDB, InfluxDB, Prometheus, Kibana, Graphite, SSH, RabbitMQ, Redis, Riak, Rancher etc.

- [Dockerfiles](https://github.com/HariSekhon/Dockerfiles) - 50+ DockerHub public images for Docker & Kubernetes - Hadoop, Kafka, ZooKeeper, HBase, Cassandra, Solr, SolrCloud, Presto, Apache Drill, Nifi, Spark, Mesos, Consul, Riak, OpenTSDB, Jython, Advanced Nagios Plugins & DevOps Tools repos on Alpine, CentOS, Debian, Fedora, Ubuntu, Superset, H2O, Serf, Alluxio / Tachyon, FakeS3

[![Stargazers over time](https://starchart.cc/HariSekhon/SQL-scripts.svg)](https://starchart.cc/HariSekhon/SQL-scripts)

[git.io/SQL](https://git.io/SQL)
