set -x
set -e
cd ~/rocky-linux-distro
touch meta-data
cat << DATA > user-data
#cloud-config
users:
  - default
  - name: admin
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    lock_passwd: false
    plain_text_passwd: qwerty
    ssh_authorized_keys:
      ssh-rsa %key%
DATA
KEY=$(cat ~/.ssh/id_rsa.pub)
echo $KEY
sed -i -e 's/%key%/$KEY/'user-data
genisoimage -output /tmp/init.iso -V cidata -r -J user-data meta-data
ls -lth /tmp/init.iso
