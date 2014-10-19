var component = function(server) {
    this.initDronsRecherging = function(userId) {
        server.database.ship.drons.getDrons(userId, function(drons) {
            for (var i = 0; i < drons.length; i++) {
                if (drons[i].recharge_start_time) {
                    if (isRechargeEnd(drons[i])) {
                        server.endDronRecharging(drons[i].dron_id, function(result) {
                            dronEndRechargeRequestToClient(userId, drons[i].dron_id);
                        });
                    }
                    else {
                        server.users[userId].processes.dronsRecharging.push(drons[i]);
                    }
                }
            }
        });
    };
    
    var isRechargeEnd = function(dron) {
        return server.components.getTime() >= (dron.recharge_start_time + dron.power / dron.recharge_bonus);
    };
    
    var dronEndRechargeRequestToClient = function(userId, dronId) {
        server.sendToUser(userId, 'dronEndRecherging', {dronId: dronId});
    };
    
    var removeDronRechargingFromProcess = function(userId, dronId) {
        for (var i = 0; i < server.users[userId].processes.dronsRecharging.length; i++) {
            if (server.users[userId].processes.dronsRecharging[i].dron_id == dronId) {
                server.users[userId].processes.dronsRecharging.splice(i, 1);
            }
        }
    };
    
    setInterval(function() {
        for(var userId in server.users) {
            var dronsRecherging = server.users[userId].processes.dronsRecherging;
            for (var i = dronsRecherging.length-1; i >= 0; i--) {
                if (isRechargeEnd(dronsRecherging[i])) {
                    server.endDronRecharging(dronsRecherging[i].dron_id, function(result) {
                        dronEndRechargeRequestToClient(userId, dronsRecherging[i].dron_id);
                        
                        removeDronRechargingFromProcess(userId, dronsRecherging[i].dron_id);
                    });
                }
            }
        }
    }, 1000);
};

exports.init = function(server) {
    return new component(server);
};

