const oracledb = require('oracledb');
const dbconfig = require('./../dbconfig');

oracledb.autoCommit = true;
oracledb.outFormat = oracledb.OBJECT;

function connect(callback) {
    oracledb.getConnection({
        user          : dbconfig.user,
        password      : dbconfig.password,
        connectString : dbconfig.connectString
    },
    function(err, connection) {
        if (err) {
            console.error(err.message);
            return;
        }
        callback(connection);
    });
};

function release(connection) {
  connection.close(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    });
}
module.exports = {
    connect, release
}