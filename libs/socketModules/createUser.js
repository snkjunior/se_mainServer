exports.connect = function(socket, server) {
    var sendResponse = function(data) {
        socket.emit('createUser', data);
    };
    var requestHandler = function(data) {
        var login = data.userLogin;
        var password = data.userPassword;
        
        server.database.users.getUserIdByLoginAndPassword(login, password, function(userId) {
            // Если пользователь не найден
            if (userId === null) {
                // Создаем нового пользователя
                server.database.users.createNewUser(login, password, function(userId) {
                    if (userId !== null) {
                        sendResponse({result: 'ok'});
                    }
                    else {
                        sendResponse({result: 'error', error: 'Ошибка базы'});
                    }
                });
            }
            else {
                sendResponse({result: 'error', error: 'Пользователь с таким именем уже существует'});
            }
        });
    };
    socket.on('createUser', requestHandler);
};
