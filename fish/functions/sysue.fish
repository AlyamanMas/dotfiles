function sysue --wraps='systemctl --user enable' --description 'alias sysue systemctl --user enable'
  systemctl --user enable $argv; 
end
