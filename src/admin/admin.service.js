const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const getUser = async (query) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    console.log("query = ", query);
    if (!query.id) {
      console.log(query);
      const user = await prisma.user.findMany();
      response = {
        status: 200,
        data: user,
      };
    } else {
      const user = await prisma.user.findMany({
        where: {
          role_id: parseInt(query.id),
        },
      });
      response = {
        status: 200,
        data: user,
      };
    }
  } catch (error) {
    console.log(error);
  }
  return response;
};

const deleteUser = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    let user = await prisma.user.findFirst({
      where: {
        email: data.email,
      },
    });
    if (user) {
      user = await prisma.user.delete({
        where: {
          email: data.email,
        },
      });
      response = {
        status: 200,
        data: {
          message: "User deleted successfully",
        },
      };
    } else {
      response = {
        status: 200,
        data: {
          message: "User not exits",
        },
      };
    }
  } catch (error) {
    console.log(error);
  }

  return response;
};
module.exports = { getUser, deleteUser };
