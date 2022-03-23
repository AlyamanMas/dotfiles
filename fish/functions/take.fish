function take --wraps='mkdir -p  && cd ' --description 'alias take mkdir -p  && cd '
  mkdir -p  $argv[1] && cd  $argv[1];
end
