var component = function(server) {
    this.initResearches = function(userId) {
        server.database.ship.researches.getActiveResearches(userId, function(researches) {
            for (var i = 0; i < researches.length; i++) {
                // Подсчитываем, сколько очков было изучено ученными с момента последнего обновления
                if (isResearchReady(researches[i])) {
                    // Если изучено больше требуемого, то заканчиваем исследование
                    server.database.ship.researches.addNewLearnResearch(userId, researches[i].research_id, function(result, researchId) {
                        if (result !== null) {
                            server.database.ship.researches.removeActiveResearch(userId, researchId, function(result) {
                                if (result !== null) {
                                    // Создаем и отправляем игроку уведомление о изученном исследовании
                                    createEndResearchNotification(userId, researchId);
                                }
                            });
                        }
                    });
                }
                else {
                    // Если изучено меньше, то добавляем в процесс изучения
                    server.users[userId].processes.researches.push(researches[i]);
                    console.log(server.users[userId].processes);
                }
            }
        });
    };
    
    this.getFreeScientists = function(userId) {
        var scientistOnResearch = 0;
        for (var i = 0; i < server.users[userId].processes.researches.length; i++) {
            scientistOnResearch += server.users[userId].processes.researches[i].scientists;
        }
        
        return server.users[userId].info.scientists - scientistOnResearch;
    };
    
    var isResearchReady = function(research) {
        return (server.components.getTime() - research.change_time) * server.params.researchSpeed >= research.last_point;
    };
    
    var removeResearchFromProcess = function(userId, researchId) {
        for (var i = 0; i < server.users[userId].processes.researches.length; i++) {
            if (server.users[userId].processes.researches[i].research_id == researchId) {
                server.users[userId].processes.researches.splice(i, 1);
            }
        }
    };
    
    var createEndResearchNotification = function(userId, researchId) {
        server.database.ship.notifications.createNewNotification(userId, 'research', researchId, function(result) {
            if (result !== null) {
                server.sendToUser(userId, 'newNotification', {type: 'research'});
            }
        });
    };
    
    setInterval(function() {
        for(var userId in server.users) {
            var researches = server.users[userId].processes.researches;
            for (var i = researches.length-1; i >= 0; i--) {
                if (isResearchReady(researches[i])) {
                    server.database.ship.researches.addNewLearnResearch(userId, researches[i].research_id, function(result, userId, researchId) {
                        if (result !== null) {
                            server.database.ship.researches.removeActiveResearch(userId, researchId, function(result) {
                                if (result !== null) {
                                    // Создаем и отправляем игроку уведомление о изученном исследовании
                                    createEndResearchNotification(userId, researchId);
                                    
                                    // Убираем исследование из очереди
                                    removeResearchFromProcess(userId, researchId);
                                }
                            });
                        }
                    });
                }
            }
        }
    }, 1000);
};

exports.init = function(server) {
    return new component(server);
};