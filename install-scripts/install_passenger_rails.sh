echo "--- Installing Rails v 2.3.8 ---"
gem install rails –v ‘2.3.8’ 
echo "--- Rails Installed successfully! ---"

echo "--- Installing Passenger ---"
gem install passenger
echo "--- Passenger Installed successfully! ---"

passenger-install-apache2-module

cp ./../golden_configs/apache/httpd.conf /etc/httpd/conf/httpd.conf
cp ./../golden_configs/cibi/cibi.conf /etc/httpd/conf.d/cibi.conf
