module.exports = {
  user          : process.env.NODE_ORACLEDB_USER || "yulia",
  password      : process.env.NODE_ORACLEDB_PASSWORD || "yulia",
  connectString : process.env.NODE_ORACLEDB_CONNECTIONSTRING || "localhost/XE",
};