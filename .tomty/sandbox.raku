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
#bash "sudo apt-get update -y; sudo apt-get install qemu-system -y && qemu-system-aarch64 --help";

bash "qemu-system-aarch64 --help";

task-run "examples/tasks/setup-qemu-image";
