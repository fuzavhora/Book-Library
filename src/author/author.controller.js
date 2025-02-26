// const { create } = require('../user/user.service');
const authorService = require("./author.service");

const create = async (data) => {
  return await authorService.create(data);
};

const login = async (data) => {
  return await authorService.login(data);
};

const deleteAuthor = async (body, header) => {
  const deleteAuthor = await authorService.deleteAuthor(body, header);
  return deleteAuthor;
};

const addBook = async (body, header) => {
  const addBook = await authorService.addBook(body, header);
  return addBook;
};

const deleteBook = async (body, header) => {
  const deleteBook = await authorService.deleteBook(body, header);
  return deleteBook;
};

//book routes

module.exports = { addBook, create, login, deleteBook, deleteAuthor };
