. $(dirname "$0")/../.env

docker exec gotoandplay-db mysqldump -u $MYSQL_USER --password=$MYSQL_PASSWORD $MYSQL_DATABASE > ./gotoandplay-db-mysql-dump.sql
# uncomment below line to avoid shell window auto close behavior
#$SHELL