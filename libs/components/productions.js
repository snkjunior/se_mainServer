var component = function(server) {
    this.initProductions = function(userId) {
        
    };
    
    this.getFreeEngineers = function(userId) {
        var enginnersOnProductions = 0;
        for (var i = 0; i < server.users[userId].processes.productions.length; i++) {
            enginnersOnProductions += server.users[userId].processes.productions[i].engineers;
        }
        
        return server.users[userId].info.engineers - enginnersOnProductions;
    };
    
    var isProdutionReady = function(production) {
        return (server.components.getTime() - production.change_time) * server.params.productionSpeed >= production.last_point;
    };
    
    var removeProductionFromProcess = function(userId, productionId) {
        for (var i = 0; i < server.users[userId].processes.productions.length; i++) {
            if (server.users[userId].processes.productions[i].production_id == productionId) {
                server.users[userId].processes.productions.splice(i, 1);
            }
        }
    };
    
    var createEndProductionNotification = function(userId, productionId) {
        server.database.ship.notifications.createNewNotification(userId, 'production', productionId, function(result) {
            if (result !== null) {
                server.sendToUser(userId, 'newNotification', {type: 'production'});
            }
        });
    };
    
    setInterval(function() {
        for(var userId in server.users) {
            var productions = server.users[userId].processes.productions;
            for (var i = productions.length-1; i >= 0; i--) {
                if (isProdutionReady(productions[i])) {
                }
            }
        }
    }, 1000);
};

exports.init = function(server) {
    return new component(server);
};