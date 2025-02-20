const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const JWT = require("jsonwebtoken");

const create = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    if (data.name && !data.email && data.password && data.role_id) {
      const { name, email, password, role_id } = data;
      const user = prisma.author.create({
        data: data,
      });

      response = {
        status: 200,
        data: {
          message: "Author successfully created",
          user,
        },
      };
    } else {
      response.data.message = "Ohh , Fields are missing!!";
    }
  } catch (error) {
    console.error(error);
  }

  return response;
};

const addBook = async (body, header) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };
  try {
    let token = header.authorization;
    let data = JWT.verify(token, process.env.JWT_SECRET);
    const addBook = await prisma.book.create({
      data: {
        name: body.name,
        price: body.price,
        des: body.des,
        type: body.type,
        author: parseInt(data.id),
      },
    });
    response = {
      status: 200,
      data: {
        message: "Book added successfully",
      },
    };
  } catch (error) {
    console.log(error);
  }
  return response;
};

module.exports = {
  addBook,
  create,
};
