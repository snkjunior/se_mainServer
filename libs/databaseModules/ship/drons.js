var module = function(connection) {
    this.getDrons = function(userId, callback) {
        var sql = "SELECT bd.dron_id, bd.recharge_start_time, SUM(de.science_bonus) AS science_bonus, SUM(de.engineer_bonus) AS engineer_bonus, SUM(de.battle_bonus) AS battle_bonus, SUM(recharge_bonus) AS recharge_bonus, SUM(power) AS power FROM `baseship__drons` AS bd JOIN baseship__drons_equipments AS bde ON bde.dron_id = bd.dron_id JOIN dron_equipments AS de ON de.equipment_id = bde.equipment_id WHERE bd.user_id = ? GROUP BY bd.dron_id";
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
    
    this.endDronRecharging = function(dronId, callback) {
        var sql = "UPDATE baseship__drons SET recharge_start_time = NULL WHERE dron_id = ? LIMIT 1";
        connection.query(sql, [dronId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(true);
            }
        });
    }
};

exports.connect = function(connection) {
    return new module(connection);
};
