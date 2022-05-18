import 'dart:io';
import 'package:ex3rutas/src/models/animal_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:mime_type/mime_type.dart';

class AnimalsProvider {
  final String _url = 'http://192.168.56.1:3000/animals';

  Future<List<AnimalModel>> cargarAnimales() async {
    final resp = await http.get(Uri.parse(_url));

    final List<dynamic> animals = json.decode(resp.body);

    final List<AnimalModel> animalsModels = [];

    try {
      animals.forEach((animal) {
        // animalsModels.add(animal);
        animalsModels.add(AnimalModel.fromJson(animal));
      });
      return animalsModels;
    } catch (e) {
      return [];
    }
  }

  Future<AnimalModel> animalPorId(String id) async {
    try {
      if (id.trim().isEmpty) throw "error";

      final resp = await http.get(Uri.parse("$_url/$id"));

      final Map<String, dynamic> animal = json.decode(resp.body);

      return AnimalModel.fromJson(animal);
    } catch (e) {
      return AnimalModel();
    }
  }

  Future<bool> actualizarAnimal(AnimalModel animal) async {
    try {
      final resp = await http.patch(Uri.parse("$_url/${animal.id}"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(animal.toJson()));

      final decodeData = json.decode(resp.body);
      print(decodeData);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> crearAnimal(AnimalModel animal) async {
    try {
      final resp = await http.post(Uri.parse(_url),
          headers: {"Content-Type": "application/json"},
          body: json.encode(animal.toJson()));

      print(json.decode(resp.body));

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarAnimal(String id) async {
    try {
      final resp = await http.delete(Uri.parse("$_url/$id"));
      print(json.decode(resp.body));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> subirImagen(File imagen) async {
    final url = Uri.parse(
        'http://@api.cloudinary.com/v1_1/dakxfiebq/image/upload?upload_preset=JavierFlutter');
    final mimeType = mime(imagen.path)!.split('/');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salió mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    //print(respData);
    return respData['secure_url'];
  }
}
