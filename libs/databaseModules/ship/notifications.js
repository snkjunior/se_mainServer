var module = function(connection) {
    this.createNewNotification = function(userId, type, data, callback) {
        var sql = "INSERT INTO baseship__notifications SET user_id = ?, type = '?', data = '?'";
        connection.query(sql, [userId, type, data], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId);
            }
        });
    };
    
    this.getNotifications = function(userId, page, limit, callback) {
        var minLimit = 1 + limit * (page - 1);
        var maxLimit = 1 + limit * (page - 1);
        var sql = "SELECT * FROM baseship__notifications WHERE user_id = ? ORDER BY timestamp DESC LIMIT " + minLimit + ", " + maxLimit;
        connection.query(sql, [userId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result);
            }
        });
    };
};

exports.connect = function(connection) {
    return new module(connection);
};
