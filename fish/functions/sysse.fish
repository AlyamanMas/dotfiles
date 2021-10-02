function sysse --wraps='sudo systemctl enable' --description 'alias sysse sudo systemctl enable'
  sudo systemctl enable $argv; 
end
