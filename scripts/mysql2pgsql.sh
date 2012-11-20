#!/bin/sh

# This script is for converting friendica's database from MySQL to
# PostgreSQL.
#
# USE AT YOUR OWN RISK!

MYSQL="$1"
# PGSQL="$2"

cat $MYSQL | sed \
		-e 's/`//g' \
		-e 's/^-.*$//g' \
		-e 's/ COMMENT .*;$//g' \
		-e 's/ UNSIGNED//g' \
		-e 's/ unsigned//g' \
		-e 's/ tinyinteger/ INTEGER/g' \
		-e 's/ tinyint(.*)/ INTEGER/g' \
		-e 's/ TINYINT(.*)/ INTEGER/g' \
		-e 's/ bigint(.*)/ INTEGER/g' \
		-e 's/ mediumtext/ TEXT/g' \
		-e 's/ IF NOT EXISTS/ /g' \
		-e 's/ENGINE=MyISAM *DEFAULT CHARSET=utf8//g' \
		-e 's/ char(255)/ VARCHAR(255)/g' \
		-e 's/ int(.*)/ INTEGER/g' \
		-e 's/ INT(.*)/ INTEGER/g' \
		-e 's/\(.*\) INTEGER.* \(NOT NULL\) AUTO_INCREMENT/\1 SERIAL \2/g' \
		-e 's/\(.*\) INT \(NOT NULL\) AUTO_INCREMENT/\1 SERIAL \2/g' \
		-e 's/ datetime/ TIMESTAMP/g' \


#		-e 's/[a-z]*-[a-z]*/_/gw mapping.txt' \
