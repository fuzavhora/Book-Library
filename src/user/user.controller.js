const userService = require("./user.service");
const userValidation = require("./user.validation");

const create = async (data) => {
  const validate = await userValidation.validate(data);

  if (!validate.isValid) {
    return validate;
  }
  return await userService.create(data);
};

const updateUser = async (body, header) => {
  return await userService.updateUser(body, header);
};

const addtocart = async (body, header) => {
  return await userService.addtocart(body, header);
};

const getCart = async (header) => {
  return await userService.getCart(header);
};

module.exports = { create, updateUser, addtocart, getCart };
