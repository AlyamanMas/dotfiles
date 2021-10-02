function syssu --wraps='sudo systemctl start' --description 'alias syssu sudo systemctl start'
  sudo systemctl start $argv; 
end
