function sysuk --wraps='systemctl --user stop' --description 'alias sysuk systemctl --user stop'
  systemctl --user stop $argv; 
end
