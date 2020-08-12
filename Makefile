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
	@echo "No build required"
	@#$(MAKE) git-summary
	@#$(MAKE) system-packages

.PHONY: init
init:
	git submodule update --init --recursive

.PHONY: all
all: build test
	@:

.PHONY: test
test:
	@./test.sh

.PHONY: push
push:
	git push --all

wc:
	@wc -l $(CODE_FILES)
	@printf "\nSQL Scripts: "
	@tr ' ' '\n' <<< "$(CODE_FILES)" | wc -l | sed 's/[[:space:]]//g'
