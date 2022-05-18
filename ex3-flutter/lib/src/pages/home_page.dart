import 'package:ex3rutas/src/providers/menu_provider.dart';
import 'package:ex3rutas/src/utils/icon_string_util.dart';
import 'package:ex3rutas/src/widgets/list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _listaItems(List data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetItem = ListItemWidget(
        title: opt['texto'],
        icon: getIcon(opt['icon']),
        ontab: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      // options.add(widgetItem);
      // options.add(Divider());

      options
        ..add(widgetItem)
        ..add(Divider());
    });

    return options;
  }
}
