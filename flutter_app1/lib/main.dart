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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          Text('hola'),
          ElevatedButton(
            child: Text('click'),
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                primary: Colors.amber
            ),
          ),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30.0),
            child: Text('Adentro del contenedor')
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[600],
        child: Text('click'),
        onPressed: (){},

      ),
    );
  }
}
