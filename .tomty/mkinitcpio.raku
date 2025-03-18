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

if %*ENV<ACTION> eq "enable_multilib_repo" {
  task-run "examples/tasks/enable-multilib", %(
       :path<pacman.conf>,
  );
} else {
  task-run "examples/tasks/disable-multilib", %(
     :path<pacman.conf>,
  );
}

