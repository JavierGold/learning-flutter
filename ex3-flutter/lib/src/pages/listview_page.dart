import 'dart:async';

import 'package:ex3rutas/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<dynamic> _Lista = [];
  ScrollController _scrollController = new ScrollController();
  bool _isloading = false;

  @override
  void initState() {
    super.initState();

    agregarElementos();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('DL', style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.amber,

            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://www.lego.com/cdn/cs/set/assets/blt167d8e20620e4817/DC_-_Character_-_Details_-_Sidekick-Standard_-_Batman.jpg?fit=crop&format=jpg&quality=80&width=800&height=426&dpr=1'),
              radius: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: TextButton(
              child: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _Lista.length,
      itemBuilder: (BuildContext context, int index) {
        return CardItemWidget(image: 'https://picsum.photos/601/400', title: _Lista[index]['text'],);
      },
    );
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          )
        ],
      );
    }
    return Container();
  }

  Future<dynamic> fetchData() async {
    _isloading = true;
    setState(() {});
    return new Timer(new Duration(seconds: 3), responseHTTP);
  }

  void responseHTTP() {
  _isloading = false;
  _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    agregarElementos();
  }
  
  void agregarElementos() {
    for (var i = 0; i < 10; i++) {
      _Lista.add({'text' : 'nombre $i'});
      setState(() {});
    }
  }
}
