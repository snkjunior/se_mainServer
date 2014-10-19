var module = function(connection) {
    this.addNewShipInfo = function(userId, name, systemId, scientists, engineers, credits, callback) {
        var sql = "INSERT INTO `baseship__info` SET `user_id` = ?, `name` = ?, `system_id` = ?, `scientists` = ?, `engineers` = ?, `credits` = ?";
        connection.query(sql, [userId, name, systemId, scientists, engineers, credits], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId);
            }
        });
    };
    
    this.getShipInfo = function(userId, callback) {
        var sql = "SELECT * FROM `baseship__info` WHERE `user_id` = ? LIMIT 1";
        connection.query(sql, [userId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                if (result.length == 0) {
                    callback(null);
                }
                else {
                    callback(result[0]);
                }
            }
        });
    }
};

exports.connect = function(connection) {
    return new module(connection);
};
