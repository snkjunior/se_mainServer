var module = function(connection) {
    this.getMissions = function(objectId, callback) {
        var sql = 'SELECT * FROM `world__systems_objects_missions` WHERE `object_id` = ?';
        connection.query(sql, [objectId], function(err, result) {
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
