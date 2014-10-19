var components = function(server) {
    this.researches = require('./components/researches').init(server);
    this.productions = require('./components/productions').init(server);
    this.dronsRecharging = require('./components/dronsRecharging').init(server);
    
    this.createUserStartInfo = function(userId, database, callback) {
        var done = 0;
        var callbackResult = true;

        // Создаем информацию о корабле
        database.ship.info.addNewShipInfo(userId, 'Новый корабль', 1, 10, 10, 1000, function(result) {
            done++;
            if (callbackResult !== null) {
                callbackResult = result;
            }
        });

        // Добавляем все модули нулевого уровня
        for (var i = 1; i < 8; i++) {
            database.ship.modules.addModule(userId, i, function(result) {
                done++;
                if (callbackResult !== null) {
                    callbackResult = result;
                }
            });
        }

        var interval = setInterval(function() {
            if (done === 8) {
                callback(callbackResult);
                clearInterval(interval);
            }
        }, 1000);
    };
    
    this.getTime = function() {
        return Math.floor((new Date()).getTime() / 1000);
    };
    
    this.initInfo = function(userId) {
        
    };
};

exports.init = function(server) {
    return new components(server);
};