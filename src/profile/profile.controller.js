const profileService = require("./profile.service");

const login = async (data) => {
  return await profileService.login(data);
};

const updateUser = async (body, header) => {
  return await profileService.updateUser(body, header);
};

const deleteUser = async (data) => {
  return await profileService.deleteUser(data);
};

module.exports = {
  login,
  deleteUser,
  updateUser,
};
