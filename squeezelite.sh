#!/bin/bash

log() {
  echo "[" `date +"%Y/%m/%d %H:%M:%S"` "]" $1;
}

notify() {
  osascript -e "display notification \"$*\" with title \"Squeezelite\""
}

waitForMojo() {
  log "Waiting for Mojo";
  notify "Waiting for Mojo";

  until system_profiler SPUSBDataType | grep "Mojo" > /dev/null; do
    sleep 10s;
  done

  log "Mojo Found";
  notify "Mojo Found";
}

while true; do
  waitForMojo;
  devid=`squeezelite -l | grep Mojo | sed -E -e 's/^[[:space:]]+//g' | cut -d ' ' -f 1`
  squeezelite -o $devid -a :0 -n 'Mac Mini' -b 8192:8192 -D -s 127.0.0.1 -d all=debug;
done
