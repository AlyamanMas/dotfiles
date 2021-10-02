function sysuu --wraps='systemctl --user start' --description 'alias sysuu systemctl --user start'
  systemctl --user start $argv; 
end
