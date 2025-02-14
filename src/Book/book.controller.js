const bookService = require("./book.service");

const getBook = async (data, body) => {
  const book = await bookService.getBook(data, body);
  return book;
};

module.exports = { getBook };
