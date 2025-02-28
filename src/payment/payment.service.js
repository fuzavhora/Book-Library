const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const JWT = require("jsonwebtoken");

// const createPaymentIntent = async (data, Headers) => {
//   let response = {
//     status: 400,
//     data: {
//       message: "Somthing went wrong",
//     },
//   };
//   try {
//     const token = JWT.verify(Headers.authorization, process.env.JWT_SECRET);
//     if (!token) {
//       response.status = 401;
//       response.data.message = "Unauthorized";
//     }
//     const user = await prisma.user.findFirst({
//       where: {
//         id: token.id,
//       },
//     });
//     console.log("Users = ", user.id);
//     if (!user) {
//       response.status = 401;
//       response.data.message = "Unauthorized";
//     } else {
//       const cart = await prisma.addtocart.findMany({
//         include: {
//           book: true,
//         },
//         where: {
//           user_id: user.id,
//         },
//       });
//       console.log("cart = ", cart);
//       let authorIncome = [];
//       let users = [];
//       let books = [];
//       let cart_id = [];
//       let totalPrice = 0;
//       for (cartItem of cart) {
//         cart_id.push(cartItem.id);
//         totalPrice += cartItem.book.price * cartItem.quantity;
//         // console.log(cartItem);
//         const author = await prisma.author.findFirst({
//           where: {
//             id: cartItem.book.author_id,
//           },
//         });
//         author.Income = author.Income + cartItem.book.price * cartItem.quantity;
//         console.log(author.Income);
//         users.push(cartItem.user_id);
//         books.push(cartItem.book_id);
//       }
//       const Payment = await prisma.payment.create({
//         data: {
//           total_price: totalPrice,
//           payment_type: data.payment_type,
//           user_id: [...users],
//           books: [...books],
//           cart_id: [...cart_id],
//         },
//       });
//       response = {
//         status: 201,
//         data: {
//           message: "Payment Intent Created",
//           Payment,
//         },
//       };
//     }
//   } catch (error) {
//     console.log("Payment Error ", error);
//   }

//   return response;
// };

const createPaymentIntent = async (data, Headers) => {
  let response = {
    status: 400,
    data: {
      message: "Something went wrong", // Fixed typo: "Somthing" to "Something"
    },
  };

  try {
    // Validate JWT token and get user ID from it
    const token = JWT.verify(Headers.authorization, process.env.JWT_SECRET);
    if (!token) {
      response.status = 401;
      response.data.message = "Unauthorized";
      return response; // Exit early if unauthorized
    }

    // Find the user from the token's ID
    const user = await prisma.user.findFirst({
      where: {
        id: token.id,
      },
    });

    if (!user) {
      response.status = 401;
      response.data.message = "Unauthorized";
      return response; // Exit early if user not found
    }

    // Fetch the cart items for the user
    const cart = await prisma.addtocart.findMany({
      include: {
        book: true, // Include the book data in the response
      },
      where: {
        user_id: user.id,
      },
    });

    if (cart.length === 0) {
      response.status = 404;
      response.data.message = "Cart is empty";
      return response; // Exit early if the cart is empty
    }

    let authorIncome = [];
    let users = [];
    let books = [];
    let cart_id = [];
    let totalPrice = 0;

    for (const cartItem of cart) {
      cart_id.push(cartItem.id);
      totalPrice += cartItem.book.price * cartItem.quantity;

      // Update the author's income
      const author = await prisma.author.findFirst({
        where: {
          id: cartItem.book.author_id,
        },
      });

      if (author) {
        author.Income += cartItem.book.price * cartItem.quantity;
        // You may want to update the author income in the DB here
        await prisma.author.update({
          where: { id: author.id },
          data: { Income: author.Income },
        });
      }

      users.push(cartItem.user_id);
      books.push(cartItem.book_id);
    }

    // Create payment record in the database
    const payment = await prisma.payment.create({
      data: {
        total_price: totalPrice,
        payment_method: {
          connect: { id: data.payment_method }, // ✅ Correct way to link payment method
        },
        user: {
          connect: { id: user.id }, // ✅ Correct way to link user
        }, // Removed unnecessary spread operator
        // books: books,
        // cart_id: cart_id,
      },
    });

    if (payment) {
      const cart = await prisma.addtocart.deleteMany({
        where: {
          user_id: user.id,
        },
      });
    }

    response = {
      status: 201,
      data: {
        message: "Payment Intent Created",
        payment, // Use the correct variable name
      },
    };
  } catch (error) {
    console.log("Payment Error:", error);
    response.data.message = "Internal Server Error";
  }

  return response;
};

module.exports = {
  createPaymentIntent,
};
