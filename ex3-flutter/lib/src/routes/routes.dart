import 'package:ex3rutas/src/pages/animals_detail_page.dart';
import 'package:ex3rutas/src/pages/animals_list_page.dart';

import 'package:ex3rutas/src/pages/home_page.dart';

import 'package:ex3rutas/src/pages/listview_page.dart';

import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'list': (BuildContext context) => ListPage(),
    'animalsList': (BuildContext context) => AnimalsListPage(),
    'animalsDetail': (BuildContext context) => AnimalDetailPage()
  };
}
