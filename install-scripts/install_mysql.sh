yum install mysql-server mysql-devel –y
/sbin/service mysqld start
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'sk4scrappers';"
mysql -uroot -psk4scrappers -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'sk4scrappers';"
/sbin/chkconfig --levels 235 mysqld on
cp /etc/my.cnf /etc/my.cnf.old
cp ./../golden_configs/mysql/my.cnf /etc/my.cnf
/sbin/service mysqld restart

