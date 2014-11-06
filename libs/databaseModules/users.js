var module = function(connection) {
    this.createNewUser = function(login, password, callback) {
        var sql = 'INSERT INTO `users` SET `login` = ?, `password` = MD5(?)';
        connection.query(sql, [login, password], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId);
            }
        });
    };

    this.getUserIdByLoginAndPassword = function(login, password, callback) {
        var sql = 'SELECT `user_id` FROM `users` WHERE `login` = ? AND `password` = MD5(?) LIMIT 1';
        connection.query(sql, [login, password], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                if (result.length == 0) {
                    callback(null);
                }
                else {
                    callback(result[0]['user_id']);
                }
            }
        });
    };
};

exports.connect = function(connection) {
    return new module(connection);
};

