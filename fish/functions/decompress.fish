function decompress --wraps='tar -xzf' --description 'Extract a .tar.gz archive'
    command tar -xzf $argv
end
