const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const { priceFilter } = require("../utils/filter");
const { auth } = require("../utils/authentication");

const getBook = async (data, body) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    if (data.search) {
      let search = data.search;
      let searchquery = {};
      if (Number(search)) {
        searchquery = {
          OR: [
            { name: { contains: search } },
            {
              author: {
                name: {
                  contains: search,
                },
              },
            },
            { type: { contains: search } },
            { price: { equals: Number(search) } },
          ],
        };
      } else {
        search = String(search).toLowerCase();
        searchquery = {
          OR: [
            { name: { contains: search } },
            {
              author: {
                name: {
                  contains: search,
                },
              },
            },
            { type: { contains: search } },
          ],
        };
      }
      const books = await prisma.book.findMany({
        where: searchquery,
        include: {
          author: true,
        },
      });
      const activeBooks = books.filter((book) => book.isActive === true);
      response = {
        status: 200,
        data: {
          message: "Books fetched successfully",
          books: activeBooks,
        },
      };
    } else {
      const books = await prisma.book.findMany({
        include: {
          author: true,
        },
      });
      const activeBooks = books.filter((book) => book.isActive === true);

      response = {
        status: 200,
        data: {
          message: "Books fetched successfully",
          books: activeBooks,
        },
      };
    }
  } catch (error) {
    console.log(error);
  }

  return response;
};

module.exports = { getBook };
