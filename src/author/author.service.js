const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const JWT = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const create = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    const { name, email, password, role_id } = data;
    const hashPassword = await bcrypt.hash(password, 10);
    const user = await prisma.author.create({
      data: {
        name: name,
        email: email,
        password: hashPassword,
        role_id: parseInt(role_id),
      },
    });

    response = {
      status: 200,
      data: {
        message: "Author successfully created",
        user,
      },
    };
  } catch (error) {
    console.error(error);
  }

  return response;
};

const login = async (data) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };

  try {
    const { email, password } = data;
    const user = await prisma.author.findUnique({
      where: {
        email: email,
      },
    });
    if (!user) {
      response = {
        status: 400,
        data: {
          message: "User not found",
        },
      };
    } else {
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        response = {
          status: 400,
          data: {
            message: "Invalid password",
          },
        };
      } else {
        const token = JWT.sign({ id: user.id }, process.env.JWT_SECRET, {
          expiresIn: "1d",
        });
        response = {
          status: 200,
          data: {
            message: "User logged in successfully",
            token,
          },
        };
      }
    }
  } catch (error) {
    console.error(error);
  }

  return response;
};

const deleteAuthor = async (body, header) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };
  try {
    let token = header.authorization;
    let data = JWT.verify(token, process.env.JWT_SECRET);
    const author = await prisma.author.findUnique({
      where: {
        id: data.id,
      },
    });
    if (!author || !author.isActive) {
      response = {
        status: 400,
        data: {
          message: "Author not found",
        },
      };
    } else {
      const deleteAuthor = await prisma.author.update({
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
          message: "Author deleted successfully",
          data: deleteAuthor,
        },
      };
    }
  } catch (error) {
    console.log(error);
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
        author_id: parseInt(data.id),
      },
    });
    response = {
      status: 200,
      data: {
        message: "Book added successfully",
        data: addBook,
      },
    };
  } catch (error) {
    console.log(error);
  }
  return response;
};

const deleteBook = async (body, header) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };
  try {
    let token = header.authorization;
    let data = JWT.verify(token, process.env.JWT_SECRET);

    const book = await prisma.book.findUnique({
      where: {
        id: parseInt(body.id),
      },
    });
    if (!book || !book.isActive) {
      response = {
        status: 400,
        data: {
          message: "Book not found",
        },
      };
    } else {
      if (book.author_id != data.id) {
        response = {
          status: 400,
          data: {
            message: "You are not authorized to delete this book",
          },
        };
      } else {
        const deleteBook = await prisma.book.update({
          where: {
            id: parseInt(body.id),
          },
          data: {
            isActive: false,
          },
        });
        response = {
          status: 200,
          data: {
            message: "Book deleted successfully",
            data: deleteBook,
          },
        };
      }
    }
  } catch (error) {
    console.log(error);
  }
  return response;
};

module.exports = {
  addBook,
  create,
  login,
  deleteBook,
  deleteAuthor,
};
