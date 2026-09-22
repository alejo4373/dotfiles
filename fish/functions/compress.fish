function compress --description 'Create a .tar.gz archive'
    test (count $argv) -eq 1; or begin
        echo 'Usage: compress <path>'
        return 1
    end
    set -l source (string replace -r '/$' '' -- "$argv[1]")
    command tar -czf "$source.tar.gz" "$source"
end
