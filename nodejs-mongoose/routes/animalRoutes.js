const { Router } = require("express");
const router = Router();

const animalController = require("../controllers/animalController");

router.get("/", animalController.getAnimals);
router.get("/:id", animalController.getAnimalById);
router.post("/", animalController.post);
router.patch("/:id", animalController.patch)
router.delete("/:id", animalController.delete);

module.exports = router;
