echo "--- Installing MYSQL YUM Packages ---"
yum install mysql-server mysql-devel –y
echo "--- MYSQL YUM Packages Installed successfully! ---"
echo "\n--- ---\n"
echo "--- Starting MySQL! ---"
/sbin/service mysqld start

echo "--- Resetting MYSQL password ---"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'sk4scrappers';"
mysql -uroot -psk4scrappers -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'sk4scrappers';"
echo "--- MYSQL password reset successfully! ---"
echo "\n--- ---\n"

echo "--- Setting chkconfig levels for mysql ---"
/sbin/chkconfig --levels 235 mysqld on
echo "\n--- ---\n"

echo "--- Backup existing mysql configs ---"
cp /etc/my.cnf /etc/my.cnf.old
echo "--- Copying golden configs for mysql ---"
cp ./../golden_configs/mysql/my.cnf /etc/my.cnf
echo "\n--- ---\n"

echo "--- Re-Starting MySQL! ---"
/sbin/service mysqld restart
echo "--- MySQL Installed successfully!! ---"
echo "\n--- ---\n"
