exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('getDrons', data);
    };
    var requestHandler = function(data) {
        console.log('Get drons request');
        server.database.ship.drons.getDrons(userId, function(result) {
            if (result === null) {
                result = [];
            }
            sendResponse({result: 'ok', info: result});
        });
    };
    socket.on('getDrons', requestHandler);
};
