import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('mi primer app'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('hola chavos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('click') ,
          onPressed: () {}
      ),
    ),

  ));
}

