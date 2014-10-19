exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('ping', data);
    };
    var requestHandler = function() {
        console.log('Ping responce from user "' + userId + '"');
        if (server.users[userId] != null) {
            server.users[userId].ping.lastResponseTime = server.component.getTime();
        }
    };
    socket.on('ping', requestHandler);
};
