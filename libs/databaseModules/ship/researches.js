var module = function(connection) {
    this.getResearches = function(userId, callback) {
        var sql = "SELECT r_i.*, IF(b_rl.research_id IS NULL, '0', '1') AS is_learned FROM researches__info AS r_i LEFT JOIN baseship__researches_learned AS b_rl ON b_rl.user_id = ? AND r_i.research_id = b_rl.research_id";
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
    
    this.getResearch = function(userId, researchId, callback) {
        var sql = "SELECT r_i.*, IF(b_rl.research_id IS NULL, '0', '1') AS is_learned FROM researches__info AS r_i LEFT JOIN baseship__researches_learned AS b_rl ON b_rl.user_id = ? AND r_i.research_id = b_rl.research_id AND b_rl.research_id = ? LIMIT 1";
        connection.query(sql, [userId, researchId], function(err, result) {
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
    
    this.getResearchesRequirements = function(researches, callback) {
        var sql = "SELECT * FROM researches__requirement_researches WHERE research_id IN("+researches.join(',')+")";
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
    
    this.getResearchesResources = function(userId, researches, callback) {
        var sql = "SELECT rrr.*, br.count AS available FROM researches__requirement_resources AS rrr JOIN baseship__resources AS br ON br.user_id = ? AND br.resource_id = rrr.resource_id WHERE research_id IN(?)";
        connection.query(sql, [userId, researches.join(",")], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result);
            }
        });
    };
    
    this.startResearch = function(userId, researchId, scientists, points, callback) {
        var sql = "INSERT INTO baseship__researches SET user_id = ?, research_id = ?, scientists = ?, last_point = ?";
        connection.query(sql, [userId, researchId, scientists, points], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId);
            }
        });
    };
    
    this.addNewLearnResearch = function(userId, researchId, callback) {
        var sql = "INSERT INTO baseship__researches_learned SET user_id = ?, research_id = ?";
        connection.query(sql, [userId, researchId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(result.insertId, userId, researchId);
            }
        });
    };
    
    this.getActiveResearches = function(userId, callback) {
        var sql = "SELECT id, user_id, research_id, scientists, last_point, UNIX_TIMESTAMP(change_time) AS change_time FROM baseship__researches WHERE user_id = ?";
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
    
    this.removeActiveResearch = function(userId, researchId, callback) {
        var sql = "DELETE FROM baseship__researches WHERE user_id = ? AND research_id = ? LIMIT 1";
        connection.query(sql, [userId, researchId], function(err, result) {
            if (err) {
                console.log(err);
                callback(null);
            }
            else {
                callback(true);
            }
        });
    };
    
};

exports.connect = function(connection) {
    return new module(connection);
};
