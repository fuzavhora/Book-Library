const JWT = require("jsonwebtoken");
require("dotenv").config();
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// Access to create a book
const auth = (role) => {
  return async (req, res, next) => {
    let token = req.headers.authorization;

    if (!token) {
      return res
        .status(401)
        .send({ message: "Unauthorized: No token provided" });
    }

    try {
      const data = JWT.verify(token, process.env.JWT_SECRET);
      const user = await prisma.user.findUnique({
        where: {
          id: data.id,
        },
      });
      console.log("Decoded Token:", data);

      if (role.includes(user.role_id)) {
        req.user = user;
        next();
      } else {
        return res
          .status(403)
          .json({ message: "Forbidden: You are not authorized" });
      }
    } catch (e) {
      console.error("JWT Verification Error:", e);
      return res
        .status(403)
        .send({ message: "Invalid or expired token", error: e.message });
    }
  };
};

//Book already exist
const bookExist = () => {
  return async (req, res, next) => {
    try {
      const { name } = req.body;
      const book = await prisma.book.findFirst({
        where: { name },
      });

      if (book) {
        return res.status(400).json({ message: "Book already exists" });
      }

      next(); // Proceed to the next middleware if the book doesn't exist
    } catch (error) {
      console.error("Error in bookExist middleware:", error);
      return res.status(500).json({ message: "Internal Server Error" });
    }
  };
};

const userAuth = () => {
  return async (req, res, next) => {
    let token = req.headers.authorization;

    if (!token) {
      return res
        .status(401)
        .send({ message: "Ohh you ar not logged in Please Login!" });
    }
    try {
      const data = JWT.verify(token, process.env.JWT_SECRET);
      console.log(data);
      const user = await prisma.user.findUnique({
        where: {
          id: data.id,
        },
      });
      console.log(user);
      if (!user) {
        return res.status(404).send({ message: "User not found" });
      }
      req.user = user;
      console.log("Decoded Token:", data);
      next();
    } catch (e) {
      console.error("JWT Verification Error:", e);
      return res
        .status(403)
        .send({ message: "Invalid or expired token", error: e.message });
    }
  };
};

const adminAuth = (role) => {
  return async (req, res, next) => {
    let token = req.headers.authorization;

    if (!token) {
      return res
        .status(401)
        .send({ message: "Ohh you ar not logged in Please Login!" });
    }
    try {
      const data = JWT.verify(token, process.env.JWT_SECRET);

      const user = await prisma.user.findUnique({
        where: {
          id: data.id,
        },
      });
      console.log(user);
      if (!user) {
        return res.status(404).send({ message: "Please Login again" });
      }
      if (role.includes(user.role_id)) {
        req.user = user;
        next();
      } else {
        return res.status(403).send({ message: "You are not authorized" });
      }
    } catch (e) {
      console.error("JWT Verification Error:", e);
      return res
        .status(403)
        .send({ message: "Invalid or expired token", error: e.message });
    }
  };
};

const cartAuth = () => {
  return async (req, res, next) => {
    let token = req.headers.authorization;

    if (!token) {
      return res
        .status(401)
        .send({ message: "Ohh you ar not logged Please Login!" });
    }
    try {
      const data = JWT.verify(token, process.env.JWT_SECRET);

      const user = await prisma.user.findUnique({
        where: {
          id: data.id,
        },
      });
      console.log(user);
      if (!user) {
        return res.status(404).send({ message: "Please Login again" });
      }
      req.user = user;
      next();
    } catch (e) {
      console.error("JWT Verification Error:", e);
      return res
        .status(403)
        .send({ message: "Invalid or expired token", error: e.message });
    }
  };
};

module.exports = { auth, bookExist, userAuth, adminAuth, cartAuth };
