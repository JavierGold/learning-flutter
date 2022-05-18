const app = require("./app")

app.listen(app.get("port"), () => {
  console.log(`Estamos corriendo en el puerto ${app.get("port")}`)
})