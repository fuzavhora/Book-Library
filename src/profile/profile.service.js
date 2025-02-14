const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const JWT = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
require("dotenv").config();

const login = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "Something went wrong",
    },
  };

  try {
    const { email, password } = data;
    if (!email || !password) {
      response = {
        status: 401,
        data: {
          message: "Please provide email and password",
        },
      };
    } else {
      let user = await prisma.user.findUnique({
        where: { email: email },
      });
      if (!user) {
        response = {
          status: 404,
          data: {
            message: "User not found",
          },
        };
        console.log("User not found");
      } else {
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
          response = {
            status: 401,
            data: {
              message: "Password is incorrect",
            },
          };
        } else {
          let token = JWT.sign({ id: user.id }, process.env.JWT_SECRET, {
            expiresIn: "1d",
          });
          response = {
            status: 200,
            data: {
              message: "User logged in successfully",
              token: token,
            },
          };
        }
      }
    }
  } catch (error) {
    console.log(error);
  }

  return response;
};

const deleteUser = async (header) => {
  let response = {
    status: 400,
    data: {
      message: " went wrong",
    },
  };

  try {
    let token = header.authorization;
    console.log(token);
    const data = JWT.verify(token, process.env.JWT_SECRET);
    const user = await prisma.user.delete({
      where: {
        id: data.id,
      },
    });
    response = {
      status: 200,
      data: {
        message: "User deleted successfully",
      },
    };
  } catch (error) {
    console.log("ERROR IN UPDATE USER", error);
    response.data.message = error.message;
  }

  return response;
};

module.exports = { login, deleteUser };
