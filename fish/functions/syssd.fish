function syssd --wraps='sudo systemctl  disable' --description 'alias syssd sudo systemctl  disable'
  sudo systemctl  disable $argv; 
end
