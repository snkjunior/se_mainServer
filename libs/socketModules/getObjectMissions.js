exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('getObjectMissions', data);
    };
    var requestHandler = function(data) {
        console.log('Get object missions request');
        var objectId = data.objectId;
        
        server.database.missions.getMissions(objectId, function(result) {
            if (result === null) {
                result = [];
            }
            sendResponse({result: 'ok', info: result});
        });
    };
    socket.on('getObjectMissions', requestHandler);
};
