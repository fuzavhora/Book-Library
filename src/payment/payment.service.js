const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const JWT = require("jsonwebtoken");

const createPaymentIntent = async (data, Headers) => {
  let response = {
    status: 400,
    data: {
      message: "Somthing went wrong",
    },
  };
  try {
    const token = JWT.verify(Headers.authorization, process.env.JWT_SECRET);
    if (!token) {
      response.status = 401;
      response.data.message = "Unauthorized";
    }
    const user = await prisma.user.findFirst({
      where: {
        id: token.id,
      },
    });
    if (!user) {
      response.status = 401;
      response.data.message = "Ohh You are not logged in";
    }
    const cart = await prisma.addtocart.findMany({
      where: {
        user_id: token.id,
      },
      include: {
        book: true,
      },
    });
    let total_price = 0;
    for (cart of cart) {
      cart.book.price = cart.book.price * cart.quantity;
      total_price += cart.book.price;
      console.log(total_price);
    }

    for (cart of cart) {
      const author_id_1 = cart.book.author_id;
      const author = await prisma.author.update({
        where: {
          id: author_id_1,
        },
        data: {
          Income: {
            increment: cart.book.price,
          },
        },
      });
    }

    response = {
      status: 200,
      data: {
        cart,
        Cart_total,
        author_id_1,
        author,
      },
    };
  } catch (error) {
    console.log("Payment Error ", error);
  }

  return response;
};

module.exports = {
  createPaymentIntent,
};
