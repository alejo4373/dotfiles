function fip --description 'Forward one or more local ports over SSH'
    test (count $argv) -ge 2; or begin
        echo 'Usage: fip <host> <port1> [port2] ...'
        return 1
    end
    set -l host $argv[1]
    for port in $argv[2..]
        command ssh -f -N -L "$port:localhost:$port" "$host"; and echo "Forwarding localhost:$port -> $host:$port"
    end
end
