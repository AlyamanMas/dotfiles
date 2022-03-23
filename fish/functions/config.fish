function config --wraps='emacsclient -c /etc/nixos/configuration.nix' --wraps='emacsclient -c /etc/nixos/configuration.nix &' --wraps='emacsclient -c /etc/nixos/configuration.nix $argv &' --description 'alias config emacsclient -c /etc/nixos/configuration.nix $argv &'
  emacsclient -c /etc/nixos/configuration.nix $argv &;
end
