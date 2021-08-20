function emc --wraps='emacsclient -c' --description 'alias emc emacsclient -c'
  emacsclient -c $argv&; 
end
