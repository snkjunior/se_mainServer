var connection = require('mysql').createConnection({
    host: 'localhost',
    user: 'root',
    password: 'gorinich',
    database: 'space_explorers',
    socketPath: '/var/run/mysqld/mysqld.sock'
});

exports.systems = require('./databaseModules/systems').connect(connection);
exports.objects = require('./databaseModules/objects').connect(connection);
exports.missions = require('./databaseModules/missions').connect(connection);

exports.ship = require('./databaseModules/ship').connect(connection);
exports.users = require('./databaseModules/users').connect(connection);



