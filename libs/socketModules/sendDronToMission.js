exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('sendDronToMission', data);
    };
    var requestHandler = function(data) {
        console.log('sendDronToMission request from user "' + userId + '"');
        
        var dronId = data.dronId;
        var missionId = data.missionId;
        
        // Существует ли такая миссия
        
        // Игрок не прошел еще эту миссию
        
        // Игрок находится в системе, в которой находится объект миссии
        
        // Существует ли такой дрон у игрока
        
        // Дрон не перезаряжается
        
    };
    socket.on('sendDronToMission', requestHandler);
};
