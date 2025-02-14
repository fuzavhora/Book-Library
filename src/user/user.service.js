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

module.exports = { create, updateUser };
