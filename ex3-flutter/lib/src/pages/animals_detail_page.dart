import 'dart:io';

import 'package:ex3rutas/src/models/animal_model.dart';
import 'package:ex3rutas/src/providers/animals_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AnimalDetailPage extends StatefulWidget {
  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  AnimalModel animalModel = AnimalModel();
  final _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final animalsProvider = AnimalsProvider();
  File? foto;

  final TextEditingController txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AnimalModel? animalData =
        ModalRoute.of(context)!.settings.arguments as AnimalModel?;

    if (animalData != null) {
      _getAnimalsData(animalData.id!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Mascota'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_sharp),
            onPressed: _tomarFoto,
          ),
          IconButton(onPressed: _seleccionarFoto, icon: Icon(Icons.photo)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearTipo(),
                _crearSwitch(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _seleccionarFoto() async {
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      _procesarImagen(File(image!.path));
    } catch (e) {
      print(e);
      _tomarFoto();
    }
  }

  void _tomarFoto() async {
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.camera);
      _procesarImagen(File(image!.path));
    } catch (e) {
      print(e);
      _tomarFoto();
    }
  }

  void _procesarImagen(File pick) {
    foto = pick;
    if (foto != null) {
      //animalModel.img = foto;
    }
    print("se tomó la foto");
    setState(() {});
    print(foto!.path);
  }

  Widget _mostrarFoto() {
    if (animalModel.img != null) {
      return FadeInImage(
        image: NetworkImage(animalModel.img!),
        placeholder: AssetImage("assets/upload.gif"),
        height: 200.0,
        fit: BoxFit.contain,
      );
    } else {
      if (foto != null) {
        return Image.file(
          foto!,
          fit: BoxFit.cover,
          height: 200.0,
        );
      } else {
        return Image.asset('assets/pet.png');
      }
    }
  }

  Widget _crearBoton() {
    return ElevatedButton(
      child: Text('Submit'),
      onPressed: () {
        _submit();
      },
    );
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();

    if (foto != null) {
      animalModel.img = await animalsProvider.subirImagen(foto!);
    }

    if (animalModel.id != null) {
      animalsProvider.actualizarAnimal(animalModel);
    } else {
      animalsProvider.crearAnimal(animalModel);
    }

    Navigator.pop(context);
  }

  Widget _crearNombre() {
    return TextFormField(
      controller: txtName,
      decoration: InputDecoration(labelText: 'Nombre mascota'),
      onSaved: (value) => animalModel.name = value,
      validator: (value) {
        if (value!.length < 2) {
          return 'Ingresa un nombre válido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTipo() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: animalModel.type ?? 'Tipo de mascota'),
      onSaved: (value) => animalModel.type = value,
      validator: (value) {
        if (value!.length < 2) {
          return 'Ingresa un tipo válido';
        } else {
          return null;
        }
      },
      initialValue: animalModel.type,
    );
  }

  Future<Null> _getAnimalsData(String id) async {
    animalModel = await animalsProvider.animalPorId(id);
    setState(() {
      txtName.text = animalModel.name!;
      animalModel = animalModel;
    });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('¿Es favorito?'),
      value: animalModel.favourite ?? true,
      onChanged: (valor) {
        setState(() {
          animalModel.favourite = valor;
        });
      },
    );
  }
}
