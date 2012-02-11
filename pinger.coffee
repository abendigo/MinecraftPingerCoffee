net = require 'net'

swapBytes = (buffer) ->
    for i in [0..buffer.length] by 2
        a = buffer[i]
        buffer[i] = buffer[i+1]
        buffer[i+1] = a
    buffer

port = 25565
host = 'localhost'

client = net.connect port, host
client.on 'connect', ->
    client.write '\xfe', 'binary'
client.on 'data', (data) ->
    console.log swapBytes(data.slice 3).toString('UCS-2')
