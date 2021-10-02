function sysud --wraps='systemctl --user disable' --description 'alias sysud systemctl --user disable'
  systemctl --user disable $argv; 
end
