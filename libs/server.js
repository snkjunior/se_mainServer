var Server = function(sockets) {
    this.users = {};
    this.params = {
        researchSpeed: 1, // Количество очков науки, которое генерирует один ученый в секунду
        productionSpeed: 1 // Количество очков производства, которое генерирует один инженер в секунду
    };
    this.sockets = sockets;
    this.database = require('./database');
    this.components = require('./components').init(this);
    
    this.bindUnknownUserHandlers = function(socket) {
        require('./socketModules/createUser').connect(socket, this);
        require('./socketModules/logIn').connect(socket, this);
    };
    
    this.bindLoginHandlers = function(socket, userId) {
        require('./socketModules/getSystemObjects').connect(socket, this, userId);
        require('./socketModules/getObjectMissions').connect(socket, this, userId);
        require('./socketModules/getDrons').connect(socket, this, userId);
        require('./socketModules/getResearches').connect(socket, this, userId);
    };
    
    this.addUser = function(socket, shipInfo, userId) {
        if (this.users[userId] != null) {
            delete this.users[userId].socket;
            this.users[userId].socket = socket;
        }
        else {
            this.users[userId] = {
                socket: socket,
                info: {
                    systemId: shipInfo.system_id,
                    scientists: shipInfo.scientists,
                    engineers: shipInfo.engineers,
                    credits: shipInfo.credits
                },
                processes: {
                    researches: [],
                    productions: [],
                    dronsRecharging: [],
                    jump: {
                        jumpSystemId: shipInfo.jump_system_id,
                        jumpStartTime: shipInfo.jump_start_time,
                        jumpEndTime: shipInfo.jump_end_time
                    }
                },
                ping: {
                    lastSendTime: this.components.getTime(),
                    lastResponseTime: this.components.getTime()
                }
            };
            
            this.components.initInfo(userId);
            this.components.researches.initResearches(userId);
            this.components.productions.initProductions(userId);
            this.components.dronsRecharging.initDronsRecherging(userId);
            //this.components.jump.initJump(userId); TODO
        }
    };
    
    this.removeUser = function(userId) {
        if (this.users[userId] != null) {
            delete this.users[userId].socket;
            delete this.users[userId];
        }
    };
    
    this.sendToUser = function(userId, event, data) {
        if (this.users[userId]) {
            if (this.user[userId].socket != null) {
                this.user[userId].socket.emit(event, data);
            }
        }
    };
};

exports.create = function(sockets) {
    return new Server(sockets);
};