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

task-run "examples/tasks/enable-multilib", %(
     :path<examples/tasks/enable-multilib/pacman.conf>,
);

task-run "examples/tasks/disable-multilib", %(
     :path<examples/tasks/disable-multilib/pacman.conf>,
);
