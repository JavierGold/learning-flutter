const { Schema, model } = require("mongoose");

const Animal = new Schema(
  {
    name: String,
    img: String,
    favourite: Boolean,
    type: String
  },
  {
    strict: true
  }
)

module.exports = model("Animal", Animal)
