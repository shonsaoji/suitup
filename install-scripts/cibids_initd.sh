#!/bin/bash
#
# chkconfig: 35 90 12
# description: CIBIDS server
#
# Get function from functions library
. /etc/init.d/functions
# Start the service CIBIDS
CIBIDS_DIR="/var/www/html/cibids-1.0-SNAPSHOT"
start() {
        cd $CIBIDS_DIR && nohup ./start &
        echo
}
# Restart the service CIBIDS
stop() {
        cd $CIBIDS_DIR && kill $(cat RUNNING_PID)
        echo
}
### main logic ###
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart|reload|condrestart)
        stop
        start
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|reload}"
        exit 1
esac
exit 0
