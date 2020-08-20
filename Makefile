#
#  Author: Hari Sekhon
#  Date: 2020-08-12 12:10:41 +0100 (Wed, 12 Aug 2020)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/SQL-scripts
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/harisekhon
#

# On Ubuntu this fails to pushd otherwise
# fails to bootstrap on Alpine
#SHELL := /usr/bin/env bash

PATH := "$(PATH):$(PWD)/bash-tools"

REPO := HariSekhon/SQL-scripts

CODE_FILES := $(shell find . -type f -name '*.sql')

# EUID /  UID not exported in Make
# USER not populated in Docker
#ifeq '$(shell id -u)' '0'
#	SUDO =
#	SUDO2 =
#else
#	SUDO = sudo
#endif

.PHONY: build
build: init
	@echo "==========="
	@echo "SQL Scripts"
	@echo "==========="
	@echo
	@if command -v mysql_test_scripts.sh &>/dev/null && \
	   command -v mariadb_test_scripts.sh &>/dev/null && \
	   command -v postgres_test_scripts.sh &>/dev/null; then \
		echo 'DevOps Bash Tools appears to be in $$PATH, no further building needed'; \
	else \
		curl https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/setup/bootstrap.sh | sh; \
	fi
	@echo

.PHONY: init
init:
	git submodule update --init --recursive

.PHONY: all
all: build test
	@:

.PHONY: test
test:
	@./test.sh

.PHONY: postgres
postgres:
	@./test.sh postgres

.PHONY: mysql
mysql:
	@./test.sh mysql

.PHONY: mariadb
mariadb:
	@./test.sh maria

.PHONY: maria
maria: mariadb
	@:

.PHONY: push
push:
	git push --all

wc:
	@wc -l $(CODE_FILES)
	@printf "\nSQL Scripts: "
	@tr ' ' '\n' <<< "$(CODE_FILES)" | wc -l | sed 's/[[:space:]]//g'
