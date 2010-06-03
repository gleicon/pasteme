#! /bin/sh

### BEGIN INIT INFO
# Provides:          pasteme
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts pasteme
# Description:       starts pasteme using start-stop-daemon
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/opt/pasteme/pasteme.py
PIDFILE=/var/run/pasteme.pid
LOGFILE=/var/log/pasteme.log
NAME=pasteme
DESC=pasteme

test -x $DAEMON || exit 0

#set -e

case "$1" in
  start)
        echo -n "Starting $DESC: "
        start-stop-daemon --make-pidfile --pidfile $PIDFILE --exec $DAEMON --start -- run >> $LOGFILE&
        echo "$NAME."
        ;;
  stop)
        echo -n "Stopping $DESC: "
        start-stop-daemon --quiet --pidfile $PIFDILE --exec $DAEMON --stop
        echo "$NAME."
        ;;
  restart|force-reload)
        echo -n "Restarting $DESC: "
        start-stop-daemon --quiet --pidfile $PIDFILE --exec $DAEMON --stop
        sleep 1
        start-stop-daemon --quiet --pidfile $PIDFILE --exec $DAEMON --start -- run >> $LOGFILE&
        echo "$NAME."
        ;;
  reload)
      echo -n "Reloading $DESC configuration: "
      start-stop-daemon --stop --signal HUP --quiet --pidfile $PIDFILE --exec $DAEMON
      echo "$NAME."
      ;;
  *)
        N=/etc/init.d/$NAME
        echo "Usage: $N {start|stop|restart|force-reload}" >&2
        exit 1
        ;;
esac

exit 0
