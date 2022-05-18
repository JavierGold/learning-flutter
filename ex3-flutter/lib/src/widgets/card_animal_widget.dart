import 'package:ex3rutas/src/models/animal_model.dart';
import 'package:ex3rutas/src/providers/animals_provider.dart';
import 'package:flutter/material.dart';

class CardAnimalWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? type;
  final String id;

  final animalProvider = new AnimalsProvider();

  CardAnimalWidget(
      {required this.image, required this.title, required this.id, this.type});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.amber,
      )),
      onDismissed: (direction) {
        animalProvider.eliminarAnimal(id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
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
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('animalsDetail', arguments: AnimalModel(id: id));
      },
      child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('$title'), Text('$type')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
