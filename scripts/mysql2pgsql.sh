#!/bin/bash

# This script is for converting friendica's database from MySQL to
# PostgreSQL.
#
# USE AT YOUR OWN RISK!

MYSQL="$1"
PGSQL="$2"

echo "Loading MySQL table in $1..."
cat $MYSQL | sed \
		-e 's/`//g' \
		-e 's/IF NOT EXISTS/ /g' \
		-e 's/ENGINE=MyISAM *DEFAULT CHARSET=utf8//g' \
		-e 's/char(255)/varchar(255)/g' \
		-e 's/int(.*)/INTEGER/g' \
		-e 's/INT(.*)/INTEGER/g' \
		-e 's/\(.*\) INTEGER.* \(NOT NULL\) AUTO_INCREMENT/\1 serial \2/g'
