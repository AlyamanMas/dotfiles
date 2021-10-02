function sysss --wraps='sudo systemctl status' --description 'alias sysss sudo systemctl status'
  sudo systemctl status $argv; 
end
