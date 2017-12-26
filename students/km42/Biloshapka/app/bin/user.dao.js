const {connect, release} = require('./connection');

class UserDao {
  
    findOne(email, password) {
        return new Promise(function(resolve, reject) {
            connect(function(connection) {
            const QUERY = `SELECT * FROM "User" WHERE USER_EMAIL=:email`;
            const params = [email];
            connection.execute(QUERY, params, function(err, result) {
                release(connection);
                if (err) {
                    console.error(err);
                    reject(err);
                }
                resolve(result.rows[0]);
            })
            });
        });
    }  

    registerUser(fields) {
        return this.findOne(fields.email)
                .then(data => this.register(fields, 'user'));
    }

    registerAdmin(fields) {
        return this.findOne(fields.email)
                .then(data => this.register(fields, 'admin'));
    }

    register(fields, type) {
         return new Promise(function(resolve, reject) {
            connect(function(connection) {
            const QUERY = 
            `
                INSERT INTO "User"(TYPE_NAME, USER_LOGIN, USER_NAME, USER_EMAIL, USER_PASSWORD, USER_PHONE) 
                VALUES (:type, :login, :name, :email, :pass, :phone)
            `;
            const params = [type, fields.login, fields.name, fields.email, fields.password, fields.phone];
            connection.execute(QUERY, params, function(err, result) {
                release(connection);
                if (err) {
                    console.error(err);
                    reject(err);
                }
                resolve(result);
            })
            });
        });
    }
}


module.exports = new UserDao();