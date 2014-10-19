exports.connect = function(socket, server) {
    var sendResponse = function(data) {
        socket.emit('logIn', data);
    };
    var requestHandler = function(data) {
        console.log('Login request');
        var login = data.userLogin;
        var password = data.userPassword;
        
        server.database.users.getUserIdByLoginAndPassword(login, password, function(userId) {
            if (userId !== null) {
                server.database.ship.info.getShipInfo(userId, function(shipInfo) {
                    if (shipInfo !== null) {
                        server.addUser(socket, shipInfo, userId);
                        server.bindLoginHandlers(socket, userId);
                        sendResponse({result: 'ok', info: {userId: userId, systemId: shipInfo.system_id}});
                    }
                    else {
                        sendResponse({result: 'error', error: 'Не найдена информация о корабле'});
                    }
                });
            }
            else {
                sendResponse({result: 'error', error: 'Пользователь не найден'});
            }
        });
    };
    socket.on('logIn', requestHandler);
};
