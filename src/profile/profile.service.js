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
      let user = await prisma.user.findFirst({
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
        if (!user.isActive) {
          response = {
            status: 401,
            data: {
              message: "User is blocked",
            },
          };
        } else {
          const isMatch = await bcrypt.compare(password, user.password);
          console.log(isMatch);
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
    if (name || password || email) {
      if (password) {
        password = await bcrypt.hash(password, 10);
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
    const user = await prisma.user.update({
      where: {
        id: data.id,
      },
      data: {
        isActive: false,
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

module.exports = { login, deleteUser, updateUser };
