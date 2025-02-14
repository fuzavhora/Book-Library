const checkEmpty = (name) => {
  if (name.trim() == "") {
    return true;
  }
  return false;
};

const validate = async (data) => {
  let response = {
    status: 200,
    isValid: true,
    data: {
      message: "",
    },
  };

  try {
    if (checkEmpty(data.name)) {
      response.isValid = false;
      response.data.message = "Name is required";
    }
  } catch (e) {
    console.log(e);
  }

  return response;
};

module.exports = { validate };
