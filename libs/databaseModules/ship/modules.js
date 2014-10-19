var module = function(connection) {
    this.addStartModules = function(userId, moduleId, callback) {
        var sql = "INSERT INTO `baseship__modules` SET `user_id` = ?, `module_id` = ?, `level` = 1";
        connection.query(sql, [userId, moduleId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId);
            }
        });
    };
};

exports.connect = function(connection) {
    return new module(connection);
};
