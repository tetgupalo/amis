const {connect, release} = require('./connection');

class FlowerDao {

    findAll() {
         return new Promise(function(resolve, reject) {
            connect(connection => {
                const QUERY = 
                `
                    SELECT * FROM "FLOWER"
                `;
                connection.execute(QUERY, [], function(err, result) {
                    release(connection);
                    if (err) {
                        console.log(err);
                        reject(err);
                    }
                    resolve(result.rows);
                });
            });
        });   
    }

    save(flower) {
        return new Promise(function(resolve, reject) {
            connect(connection => {
                const QUERY = 
                `
                    INSERT INTO "FLOWER"(FLOWER_NAME, FLOWER_PRICE, FLOWER_STATUS, FLOWER_QUONTITY)
                    VALUES (:name, :price, :status, :quon)
                `;
                const params = [flower.name, flower.price, flower.status, flower.quantity];
                connection.execute(QUERY, params, function(err, result) {
                    release(connection);
                    if (err) {
                        console.log(err);
                        reject(err);
                    }
                    resolve(result);
                });
            });
        });
    }

}

module.exports = new FlowerDao();