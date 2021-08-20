function sysu --wraps='systemctl --user' --description 'alias sysu systemctl --user'
  systemctl --user $argv; 
end
