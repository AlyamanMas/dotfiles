# `PATH` Extensions
set -a PATH /home/vex/.cargo/bin/
set -a PATH /home/yaman/.local/share/bin/
set -a PATH /home/yaman/.emacs.d/bin/
# sh /home/yaman/.nix-profile/etc/profile.d/nix.sh
set -a PATH /home/yaman/.local/bin/
set -a PATH /home/yaman/.emacs.d/bin/
set -a PATH /home/yaman/.npm-global/bin/

# set emacs as visual editor
set VISUAL 'emacsclient -c'

# init nix (taken from `https://github.com/yachi/fish-nix/blob/master/conf.d/nix.fish`)
if test -e "$HOME/.nix-profile/etc/profile.d/nix.sh"
  eval (bash -c "source $HOME/.nix-profile/etc/profile.d/nix.sh; echo export NIX_PATH=\"\$NIX_PATH\"; echo export PATH=\"\$PATH\"")
end

# Prompt (Starship)
starship init fish | source

# Keybindings
function fish_user_key_bindings
  bind \el 'echo; el -G; echo \n; commandline -f repaint'
  bind \eL 'echo; exa -a; echo \n; commandline -f repaint'
end

# # TokyoNight Color Palette
# set -l foreground c0caf5
# set -l selection 33467C
# set -l comment 565f89
# set -l red f7768e
# set -l orange ff9e64
# set -l yellow e0af68
# set -l green 9ece6a
# set -l purple 9d7cd8
# set -l cyan 7dcfff
# set -l pink bb9af7
# 
# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment
# 
# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment


# sh /home/yaman/.nix-profile/etc/profile.d/nix.sh
