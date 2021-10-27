function syssr --wraps='sudo systemctl restart' --description 'alias syssr sudo systemctl restart'
  sudo systemctl restart $argv; 
end
