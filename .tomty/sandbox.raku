#!raku

=begin tomty 
%(
  tag => [ "sandbox" ]
)
=end tomty

# task-run "examples/tasks/mkinitcpio", %(
#     :path<examples/tasks/mkinitcpio/mkinitcpio.conf>,
# );

# say "====";

# say "examples/tasks/mkinitcpio/mkinitcpio.conf".IO.slurp();

=begin comment 
if %*ENV<ACTION> eq "enable_multilib_repo" {
  task-run "examples/tasks/enable-multilib", %(
       :path<pacman.conf>,
  );
} else {
  task-run "examples/tasks/disable-multilib", %(
     :path<pacman.conf>,
  );
}
=end comment 

bash "mkdir -p ~/rocky-linux-distro";
#bash "cd ~/rocky-linux-distro && sudo apt-get install wget -y && wget https://dl.rockylinux.org/pub/rocky/9.5/images/aarch64/Rocky-9-GenericCloud-Base.latest.aarch64.qcow2";
bash "sudo apt-get install qemu -y && qemu-system-aarch64 --help";

bash q:to /CODE/;
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
CODE
