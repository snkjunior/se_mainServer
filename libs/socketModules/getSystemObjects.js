exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('getSystemObjects', data);
    };
    var requestHandler = function(data) {
        console.log('Get system objects request');
        var systemId = data.systemId;
        
        server.database.objects.getObjects(systemId, function(result) {
            if (result === null) {
                result = [];
            }
            sendResponse({result: 'ok', info: result});
        });
    };
    socket.on('getSystemObjects', requestHandler);
};
