#! /bin/sh

kill -9 $(pstree -lp | grep -- -status_bar.sh | sed "s/.*sleep(\([0-9]\+\)).*/\1/")
