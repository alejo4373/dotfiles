function lip --description 'List SSH port forwards'
    command pgrep -af 'ssh.*-L [0-9]+:localhost:[0-9]+'; or echo 'No active forwards'
end
