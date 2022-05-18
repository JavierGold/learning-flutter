const express = require("express");
const app = express();

const { json, urlencoded } = require("body-parser");

const cors = require("cors");
const morgan = require("morgan");

const mongoose = require("mongoose");


const animalRoutes = require("./routes/animalRoutes.js");

app.set("port", 3000);

app.use(cors());
app.use(json());
app.use(urlencoded({ extended: false }));

app.use(morgan("dev"));

mongoose
  .connect("mongodb://localhost:27017/TesiMongoose")
  .then((db) => {
    console.log("Conectado a mongo");
  })
  .catch((error) => {
    console.error("No se pudo conectar a mongodb: ", error);
  });


app.use("/animals", animalRoutes);

module.exports = app;
