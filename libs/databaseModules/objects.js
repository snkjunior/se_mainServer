var module = function(connection) {
    this.getObjects = function(systemId, callback) {
        var sql = 'SELECT * FROM `world__systems_objects` WHERE `system_id` = ?';
        connection.query(sql, [systemId], function(err, result) {
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
