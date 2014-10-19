var module = function(connection) {
    this.info = require('./ship/info').connect(connection);
    this.modules = require('./ship/modules').connect(connection);
    this.drons = require('./ship/drons').connect(connection);
    this.missions = require('./ship/missions').connect(connection);
    this.researches = require('./ship/researches').connect(connection);
    this.notifications = require('./ship/notifications').connect(connection);
};

exports.connect = function(connection) {
    return new module(connection);
};