
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function ontab;

  ListItemWidget({required this.title, this.icon, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: Icon(Icons.arrow_right),
      onTap: () {
        ontab();
      },
    );
  }
}