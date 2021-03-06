#!/bin/bash

echo "Installing Redis Server"
cd /opt
if [ ! -d "redis-2.4.18" ]; then
	echo "Downloading Redis Package"

	wget http://redis.googlecode.com/files/redis-2.4.18.tar.gz
	tar xvzf redis-2.4.18.tar.gz
else
	echo "Redis Package Found on the System"
fi

cd redis-2.4.18

echo "Compiling..."
make

echo "Copying Executables"

cp src/redis-server /usr/local/bin
cp src/redis-cli /usr/local/bin

if [ ! -d "/etc/redis" ]; then
	sudo mkdir /etc/redis
fi

sudo cp utils/redis_init_script /etc/init.d/redis_6379
sudo cp redis.conf /etc/redis/6379.conf

if [ ! -d "/var/redis/6379"]; then
	sudo mkdir -p /var/redis/6379
fi


sudo update-rc.d redis_6379 defaults

echo "Installation Complete. Starting Server.."
echo "Make sure you copy the golden configs to /etc/redis directory and restart server"
/etc/init.d/redis_6379 start