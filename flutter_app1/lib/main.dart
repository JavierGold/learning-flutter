import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('mi primera app Flutter'),
          centerTitle: true,
          backgroundColor: Colors.red[600]
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.mail),
          label: Text("Email me"),
          style: ElevatedButton.styleFrom(primary: Colors.black),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[600],
        child: Text('click'),
        onPressed: (){},
      ),
    );
  }
}
