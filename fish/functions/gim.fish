function gim --wraps='git commit -am' --description 'alias gim git commit -am'
  git commit -am $argv; 
end
