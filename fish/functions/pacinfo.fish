function pacinfo --wraps='pacman -Qi' --wraps='pacman -Si' --description 'alias pacinfo pacman -Si'
  pacman -Si $argv; 
end
