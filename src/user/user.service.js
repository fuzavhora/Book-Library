const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const bcrypt = require("bcryptjs");
const JWT = require("jsonwebtoken");

const create = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "somthing went wrong",
    },
  };

  try {
    if (data) {
      if (data.name && data.user && data.type) {
        data.password = await bcrypt.hash(data.password, 10);
        const user = await prisma.user.create({
          data: data,
        });

        response = {
          status: 200,
          data: {
            message: "User created successfully",
            user: user,
          },
        };
      } else {
        response = {
          status: 400,
          data: {
            message: "Please enter All required fields",
          },
        };
      }
    } else {
      response = {
        status: 401,
        data: {
          message: "Please enter All required feilds",
        },
      };
    }
  } catch (error) {
    console.log(error);
  }

  return response;
};

const updateUser = async (body, header) => {
  let response = {
    status: 400,
    data: {
      message: "somthing went wrong",
    },
  };

  try {
    let token = header.authorization;
    const data = JWT.verify(token, process.env.JWT_SECRET);
    let { name, email, password } = body;
    console.log(name);
    if (name || password || email) {
      if (data.password) {
        password = await bcrypt.hash(data.password, 10);
      }
      const updatedUser = await prisma.user.update({
        where: {
          id: data.id,
        },
        data: {
          name: name,
          email: email,
          password: password,
        },
      });
      response = {
        status: 200,
        data: {
          message: "User updated successfully",
          user: updatedUser,
        },
      };
      user.name = data.name;
      user.email = data.email;
      user.password = data.password;
    }
  } catch (error) {
    console.log(error);
  }
  return response;
};

const addtocart = async (body, header) => {
  let response = {
    status: 400,
    data: {
      message: "somthing went wrong",
    },
  };

  try {
    let { item } = body;

    let cartItem = [];

    let token = header.authorization;
    const data = JWT.verify(token, process.env.JWT_SECRET);
    const user = await prisma.user.findFirst({
      where: {
        id: data.id,
      },
    });
    if (user) {
      for (const { book_id } of item) {
        let cart;
        let book = await prisma.book.findMany({
          where: { id: book_id },
        });

        if (!book) {
          response = {
            status: 400,
            data: {
              message: "Book not found",
            },
          };
        } else {
          cart = await prisma.addtocart.create({
            data: {
              user_id: user.id,
              book_id: book_id,
            },
          });
        }
        cartItem.push(cart);
      }
      response = {
        status: 400,
        data: {
          message: "Added cart item successfully",
          cartItem: cartItem,
        },
      };
    } else {
      response = {
        status: 400,
        data: {
          message: "User not found",
        },
      };
    }
  } catch (error) {
    console.log(error);
  }
  return response;
};

const getCart = async (header) => {
  let response = {
    status: 400,
    data: {
      message: "somthing went wrong",
    },
  };

  try {
    let token = header.authorization;
    const data = JWT.verify(token, process.env.JWT_SECRET);
    const user = await prisma.user.findFirst({
      where: {
        id: data.id,
      },
    });
    console.log(user);
    if (user) {
      const cart = await prisma.addtocart.findMany({
        where: {
          user_id: user.id,
        },
        include: {
          book: true,
          user: true,
        },
      });
      console.log(cart);

      if (cart.length == 0) {
        response = {
          status: 200,
          data: {
            message: "Cart is empty",
          },
        };
      } else {
        response = {
          status: 200,
          data: {
            message: "Cart fetched successfully",
            cart,
          },
        };
      }
    }
  } catch (error) {
    console.log(error);
  }
  return response;
};
module.exports = { create, updateUser, addtocart, getCart };
