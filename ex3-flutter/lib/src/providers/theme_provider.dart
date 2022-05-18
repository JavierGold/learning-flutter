import 'package:flutter/material.dart';

 Map<int, Color> _color = {
    50 : Color.fromRGBO(27, 94, 32, .1),
    100 : Color.fromRGBO(27, 94, 32, .2),
    200 : Color.fromRGBO(27, 94, 32, .3),
    300 : Color.fromRGBO(27, 94, 32, .4),
    400 : Color.fromRGBO(27, 94, 32, .5),
    500 : Color.fromRGBO(27, 94, 32, .6),
    600 : Color.fromRGBO(27, 94, 32, .7),
    700 : Color.fromRGBO(27, 94, 32, .8),
    800 : Color.fromRGBO(27, 94, 32, .9),
    900 : Color.fromRGBO(27, 94, 32, 1),

  };
  

  MaterialColor colorCustom = MaterialColor(0xFF1b5e20, _color);

class MyThemes {

  static final darkTheme = ThemeData(
    // primaryColor: Color(0xFF1b5e20),
    // scaffoldBackgroundColor: Colors.amber,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
  );

  static final lightTheme = ThemeData(colorScheme: ColorScheme.light());
}
