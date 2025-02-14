const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const { priceFilter } = require("../utils/filter");

const getBook = async (data, body) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    // let search = data.search;
    // console.log("Data = ", data);
    if (data.search) {
      let search = data.search;
      let searchquery = {};
      searchquery = {
        OR: [
          { name: { contains: search } },
          {
            user: {
              name: {
                contains: search,
              },
            },
          },
          { type: { contains: search } },
        ],
      };
      const book = await prisma.book.findMany({
        where: searchquery,
        include: {
          user: {
            select: {
              id: true,
              name: true,
              img: true,
            },
          },
        },
      });
      if (body) {
        if (body.price) {
          let finalData = priceFilter(book, body.price);
          response = {
            status: 200,
            data: {
              message: "Book fetched successfully",
              finalData,
            },
          };
        }
        if (body.type) {
          let finalData = book.filter((item) => item.type === body.type);
          response = {
            status: 200,
            data: {
              message: "Book fetched successfully",
              finalData,
            },
          };
        }
        if (body.user) {
          let finalData = book.filter((item) => item.user.name === body.user);
          response = {
            status: 200,
            data: {
              message: "Book fetched successfully",
              finalData,
            },
          };
        }
      } else {
        response = {
          status: 200,
          data: {
            message: "Book fetched successfully",
            book,
          },
        };
      }
    } else {
      console.log("getting all books");

      const book = await prisma.book.findMany({
        include: {
          user: {
            select: {
              id: true,
              name: true,
              img: true,
            },
          },
        },
      });
      console.log(body.length);

      if (body.price) {
        let finalData = priceFilter(book, body.price);
        response = {
          status: 200,
          data: {
            message: "Book fetched successfully",
            finalData,
          },
        };
      } else if (body.type) {
        let finalData = book.filter((item) => item.type === body.type);
        response = {
          status: 200,
          data: {
            message: "Book fetched successfully",
            finalData,
          },
        };
      } else if (body.user) {
        let finalData = book.filter((item) => item.user.name === body.user);
        response = {
          status: 200,
          data: {
            message: "Book fetched successfully",
            finalData,
          },
        };
      } else {
        response = {
          status: 200,
          data: {
            message: "Book fetched successfully",
            book,
          },
        };
      }
    }
  } catch (error) {
    console.log(error);
  }

  return response;
};

module.exports = { getBook };
