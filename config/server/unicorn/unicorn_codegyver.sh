#!/bin/sh
### BEGIN INIT INFO
# Provides:          unicorn
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start unicorn at boot time
# Description:       Run input app server
### END INIT INFO
set -e
# Example init script, this can be used with nginx, too,
# since nginx and unicorn accept the same signals

# Feel free to change any of the following variables for your app:
TIMEOUT=${TIMEOUT-60}
APP_ROOT=/home/deploy/apps/codegyver/current
PID_PATH=$APP_ROOT/tmp/pids
PID=$PID_PATH/unicorn.pid
ENVIRONMENT=production
AS_USER=deploy
CMD="cd $APP_ROOT; bundle exec unicorn -E $ENVIRONMENT -D -c $APP_ROOT/config/server/unicorn/config.rb"
action="$1"
set -u

old_pid="$PID.oldbin"

cd $APP_ROOT || exit 1

sig () {
  test -s "$PID" && kill -$1 `cat $PID`
}

oldsig () {
  test -s $old_pid && kill -$1 `cat $old_pid`
}

workersig () {
  workerpid="$PID_PATH/unicorn.$2.pid"
  test -s "$workerpid" && kill -$1 `cat $workerpid`
}

run () {
  if [ "$(id -un)" = "$AS_USER" ]; then
    eval $1
  else
    su -c "$1" - $AS_USER
  fi
}

case $action in
status )
  sig 0 && echo >&2 "unicorn is running." && exit 0
  echo >&2 "unicorn is not running." && exit 1
  ;;
start)
  sig 0 && echo >&2 "Already running" && exit 0
  run "$CMD"
  ;;
stop)
  sig QUIT && exit 0
  echo >&2 "Not running"
  ;;
force-stop)
  sig TERM && exit 0
  echo >&2 "Not running"
  ;;
restart|reload)
  sig HUP && echo reloaded OK && exit 0
  echo >&2 "Couldn't reload, starting '$CMD' instead"
  run "$CMD"
  ;;
upgrade)
  sig USR2 && sleep 5 && echo "upgraded OK" && exit 0
  ;;
kill_worker)
  workersig QUIT $2 && exit 0
  echo >&2 "Worker not running"
  ;;

reopen-logs)
  sig USR1
  ;;
*)
  echo >&2 "Usage: $0 <start|stop|restart|upgrade|force-stop|reopen-logs>"
  exit 1
  ;;
esac
