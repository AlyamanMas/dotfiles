function kpxo --wraps='keepassxc .config/main.kdbx&' --wraps='keepassxc .config/main.kdbx $argv&' --description 'alias kpxo keepassxc .config/main.kdbx $argv&'
  cd ~ && keepassxc .config/main.kdbx $argv&;
end
