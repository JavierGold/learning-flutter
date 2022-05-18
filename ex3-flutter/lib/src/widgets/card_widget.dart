import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {

  final String? image;
  final String? title;

  CardItemWidget({this.image = '', this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: _card(context),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: 0.2,
                offset: Offset(0.0, 5.0))
          ],
          color: Colors.white),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(image.toString()),
            placeholder: AssetImage('assets/upload.gif'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,

          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('$title'),
          )
        ],
      ),
    );
  }
}