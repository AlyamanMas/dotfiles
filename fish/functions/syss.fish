function syss --wraps='sudo systemctl' --description 'alias syss sudo systemctl'
  sudo systemctl $argv; 
end
