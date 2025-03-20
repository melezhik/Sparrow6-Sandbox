pid=$(cat /tmp/box.pid)

ps uax | grep $pid

kill $pid 

ps uax | grep $pid

ps uax | grep qemu | grep -v grep
