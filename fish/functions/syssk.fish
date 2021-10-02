function syssk --wraps='sudo systemctl stop' --description 'alias syssk sudo systemctl stop'
  sudo systemctl stop $argv; 
end
