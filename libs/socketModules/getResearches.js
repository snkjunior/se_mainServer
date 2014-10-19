exports.connect = function(socket, server, userId) {
    var sendResponse = function(data) {
        socket.emit('getResearches', data);
    };
    var requestHandler = function(data) {
        console.log('Get researches');
        
        server.database.ship.researches.getResearches(userId, function(result) {
            if (result !== null) {
                var notResearched = {};
                var researchedIds = [];
                var notResearchedIds = [];
                for (var i = 0; i < result.length; i++) {
                    if (result[i].is_learned == 0) {
                        notResearchedIds.push(result[i].research_id);
                        notResearched[result[i].research_id] = result[i];
                    }
                    else {
                        researchedIds.push(result[i].research_id);
                    }
                }
                
                server.database.ship.researches.getResearchesRequirements(notResearchedIds, function(data) {
                    if (data !== null) {
                        // Забиваем все исследования требованиями исследований
                        for (var researchId in notResearched) {
                            notResearched[researchId].requireResearches = [];
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].research_id == researchId) {
                                    notResearched[researchId].requireResearches.push(data[i].requirement_research_id);
                                }
                            }
                        }
                        
                        // Удаляем все исследования, у которых не исследована одна наука
                        notResearchedIds = [];
                        for (var researchId in notResearched) {
                            var canResearch = true;
                            for (var i = 0; i < notResearched[researchId].requireResearches.length; i++) {
                                if (researchedIds.indexOf(notResearched[researchId].requireResearches[i]) == -1) {
                                    canResearch = false;
                                }
                            }
                            
                            if (!canResearch) {
                                delete notResearched[researchId];
                            } else {
                                notResearched[researchId].resources = {};
                                notResearchedIds.push(researchId);
                            }
                        }
                        
                        // Добавляем информацию по ресурсам
                        server.database.ship.researches.getResearchesResources(userId, notResearchedIds, function(resources) {
                            if (resources !== null) {
                                for (var i = 0; i < resources.length; i++) {
                                    notResearched[resources[i].research_id].resources[resources[i].resource_id] = {
                                        need: resources[i].count,
                                        available: resources[i].available
                                    };
                                }
                                
                                // Добавляем информацию о текущих исследованиях(server.user.processes.researches)
                                for (var i = 0; i < server.users[userId].processes.researches.length; i++) {
                                    notResearched[server.users[userId].processes.researches[i].research_id].progress = server.users[userId].processes.researches[i];
                                }
                                
                                sendResponse({result: 'ok', info: {
                                        researches: notResearched,
                                        freeScientists: server.components.researches.getFreeScientists(userId)
                                }});
                            }
                        });
                    }
                });
            }
        });
    };
    socket.on('getResearches', requestHandler);
};
