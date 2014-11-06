exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('getSystems', data);
    };
    var requestHandler = function(data) {
        
    };
    socket.on('getSystems', requestHandler);
};
