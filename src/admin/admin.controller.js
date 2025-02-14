const adminService = require("./admin.service");

const getUser = async (query) => {
  const user = await adminService.getUser(query);
  return user;
};

const deleteUser = async (data) => {
  const user = await adminService.deleteUser(data);
  return user;
};

module.exports = { getUser, deleteUser };
