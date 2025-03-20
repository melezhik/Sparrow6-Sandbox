set -x

ps axf | grep "qemu-system-aarch64" | grep -v grep | awk '{print "kill -9 " $1}' | sh

