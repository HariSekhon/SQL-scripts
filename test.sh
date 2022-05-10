#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2020-08-12 12:13:30 +0100 (Wed, 12 Aug 2020)
#
#  https://github.com/harisekhon/sql
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir"

if ! type -P mysql_test_scripts.sh &>/dev/null ||
   ! type -P mariadb_test_scripts.sh &>/dev/null ||
   ! type -P postgres_test_scripts.sh &>/dev/null; then
    # downloads and builds DevOps-Bash-tools repo in $PWD/bash-tools - this is where the postgres/mysql/mariadb boot + test scripts are
    curl https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/setup/bootstrap.sh | sh
fi

export PATH="$PATH:$srcdir/bash-tools"

# if this exists it means we bootstrapped above because the tools weren't in the $PATH
if [ -d "bash-tools" ]; then
    pushd bash-tools
    make update2
    popd
    echo
fi

hr(){
    echo
    echo "# ============================================================================ #"
    echo
}

echo
if [ $# -eq 0 ] || [[ "$*" =~ mysql ]]; then
    mysql_test_scripts.sh
    hr
fi
if [ $# -eq 0 ] || [[ "$*" =~ postgres ]]; then
    postgres_test_scripts.sh
    hr
fi
if [ $# -eq 0 ] || [[ "$*" =~ maria ]]; then
    mariadb_test_scripts.sh
    hr
fi
