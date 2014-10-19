var module = function(connection) {
    this.getMissionInfo = function(userId, missionId, callback) {
        var sql = '\
            SELECT wsom.*, wso.system_id, bmd.mission_id AS is_done, \n\
                bmc.mission_id AS is_current, \n\
               	bmc.science_points AS current_science_points, \n\
                bmc.engineer_points AS current_engineer_points, \n\
                bmc.battle_points AS current_battle_points \n\
            FROM `world__systems_objects_missions` AS wsom \n\
            JOIN `world__systems_objects` AS wso \n\
                ON wsom.object_id = wso.object_id \n\
            LEFT JOIN `baseship__missions_done` AS bmd \n\
                ON bmd.user_id = ? \n\
                AND bmd.mission_id = wsom.mission_id \n\
            LEFT JOIN `baseship__missions_current` AS bmc \n\
                ON bmc.user_id = ? \n\
                AND bmc.mission_id = wsom.mission_id \n\
            WHERE wsom.mission_id = ? \n\
            LIMIT 1 \n\
        ';
        connection.query(sql, [userId, userId, missionId], function(err, result) {
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
    };
};

exports.connect = function(connection) {
    return new module(connection);
};
