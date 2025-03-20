set -e
set -x

iso=$(config iso)

seed=$(config seed)

pid=$$ 

echo -n $pid > /tmp/box.pid

qemu-system-aarch64 \
-net nic \
-net user,hostfwd=tcp::10022-:22 \
-m 6024M \
-smp 8 \
-vnc none \
-drive "file=$iso,index=0,format=qcow2,media=disk" \
-drive file=$seed,index=1,media=cdrom \
-nographic 