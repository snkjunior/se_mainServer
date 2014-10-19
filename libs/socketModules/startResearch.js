exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('startResearch', data);
    };
    var requestHandler = function(data) {
        console.log('Start new research');
        
        var researchId = data.researchId;
        
        server.database.ship.researches.getResearch(userId, researchId, function(research) {
            if (research !== null) {
                if (research.is_learned == 1) {
                    sendResponse({result: 'error', error: 'Вы уже изучили данное исследование'});
                }
                else {
                    
                }
            }
        });
    };
    socket.on('startResearch', requestHandler);
};
