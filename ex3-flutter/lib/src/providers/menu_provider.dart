import 'dart:convert';
import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> cargarData() async {
    final res = await rootBundle.loadString('data/menu_opt.json');
    Map dataMap = json.decode(res);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = _MenuProvider();