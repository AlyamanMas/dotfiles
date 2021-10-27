function sysur --wraps='systemctl --user restart' --description 'alias sysur systemctl --user restart'
  systemctl --user restart $argv; 
end
