// const { create } = require('../user/user.service');
const authorService = require("./author.service");

const create = async (data) => {
  return await authorService.create(data);
};

const addBook = async (body, header) => {
  const addBook = await authorService.addBook(body, header);
  return addBook;
};

//book routes

module.exports = { addBook, create };
