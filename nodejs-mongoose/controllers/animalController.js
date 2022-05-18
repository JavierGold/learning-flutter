const Animal = require("../models/animalModel");
const animalController = {};

animalController.getAnimals = async (req, res) => {
  try {
    let animals = await Animal.find({});
    res.json(animals);
  } catch (error) {
    res.status(500).json({ error });
  }
};

animalController.getAnimalById = async (req, res) => {
  const { id } = req.params;
  try {
    let animal = await Animal.findById(id);

    if (animal) {
      res.json(animal);
    } else {
      throw { status: 404, message: "No se encontro el animal" };
    }
  } catch (error) {
    res
      .status(error.status ? error.status : 500)
      .json({ error: error.status ? error.message : error });
  }
};

animalController.post = async (req, res) => {
  const { name, type } = req.body;
  try {
    if (!name || !type) {
      throw { status: 400, message: "Faltan datos" };
    }

    var animalExpect = {};

    const expectedParams = ["name", "img", "favourite", "type"];

    Object.keys(req.body).forEach((key) => {
      if (expectedParams.includes(key)) {
        animalExpect[key] = req.body[key];
      }
    });

    let animal = new Animal(animalExpect);

    await animal.save();

    res.json(animal);
  } catch (error) {
    res
      .status(error.status ? error.status : 500)
      .json({ error: error.status ? error.message : error });
  }
};

animalController.patch = async (req, res) => {
  const { id } = req.params;

  try {
    var animalExpect = {};

    const expectedParams = ["name", "img", "favourite", "type"];

    Object.keys(req.body).forEach((key) => {
      if (expectedParams.includes(key)) {
        animalExpect[key] = req.body[key];
      }
    });

    await Animal.updateOne({ _id: id }, animalExpect);

    res.json({ message: "Se actualizó correctamente" });
  } catch (error) {
    res.status(500).json({ error });
  }
};

animalController.delete = async (req, res) => {
  const { id } = req.params;

  try {
    let remove = await Animal.deleteOne({ _id: id });
    res.json({ message: "Se eliminó el animal correctamente" });
  } catch (error) {
    res.status(404).json({ message: "No se encontró el animal " });
  }
};

module.exports = animalController;
