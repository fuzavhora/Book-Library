const pagination = async (pageSize, pageNumber, data) => {
  const end = pageSize * pageNumber;
  const start = end - pageSize;
  const result = await data.slice(start, end);
  return result;
};

module.exports = { pagination };
