import 'package:ex3rutas/src/providers/theme_provider.dart';
import 'package:ex3rutas/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
      },
    );
  }
}
