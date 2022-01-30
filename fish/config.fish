# `PATH` Extensions
set -a PATH /home/vex/.cargo/bin/
set -a PATH /home/yaman/.local/share/bin/
set -a PATH /home/yaman/.emacs.d/bin/

# Prompt (Starship)
starship init fish | source

# sh /home/yaman/.nix-profile/etc/profile.d/nix.sh
