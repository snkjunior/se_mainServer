var module = function(connection) {
    this.getSystems = function(callback) {
        var sql = 'SELECT * FROM `world__systems`';
        connection.query(sql, function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result);
            }
        });
    };
    
    this.getSystem = function(systemId, callback) {
        var sql = 'SELECT * FROM `world__systems` WHERE `system_id` = ? LIMIT 1';
        connection.query(sql, [systemId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                if (result.length != 0) {
                    callback(result[0]);
                }
                else {
                    callback(null);
                }
            }
        });
    }
};

exports.connect = function(connection) {
    return new module(connection);
};
