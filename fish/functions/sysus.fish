function sysus --wraps='systemctl --user status' --description 'alias sysus systemctl --user status'
  systemctl --user status $argv; 
end
