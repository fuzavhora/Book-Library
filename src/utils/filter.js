const priceFilter = (books, sortOrder = "asc") => {
  if (sortOrder === "asc") {
    return books.sort((a, b) =>
      sortOrder === "asc" ? a.price - b.price : b.price - a.price
    );
  } else {
    return books.sort((a, b) =>
      sortOrder === "desc" ? b.price - a.price : a.price - b.price
    );
  }
};

module.exports = { priceFilter };
