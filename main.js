var io = require('socket.io').listen(7222);
io.set('log level', 1);

var server = require('./libs/server').create(io.sockets.sockets);

io.sockets.on('connection', function (socket) {
    server.bindUnknownUserHandlers(socket);
});