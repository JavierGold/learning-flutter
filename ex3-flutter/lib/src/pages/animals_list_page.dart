import 'package:ex3rutas/src/models/animal_model.dart';
import 'package:ex3rutas/src/providers/animals_provider.dart';
import 'package:ex3rutas/src/widgets/card_animal_widget.dart';
import 'package:ex3rutas/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class AnimalsListPage extends StatefulWidget {
  @override
  _AnimalsListPageState createState() => _AnimalsListPageState();
}

class _AnimalsListPageState extends State<AnimalsListPage> {
  Future<List<AnimalModel>>? animalFuture;
  ScrollController _scrollController = ScrollController();
  final animalsProvider = new AnimalsProvider();


  @override
  void initState() {
    super.initState();

    fetchData();

    _scrollController.addListener(() {
      if ((_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) ||
          (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent)) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal List Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _crearLista(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('animalsDetail');
        },
      ),
    );
  }

  Future<Null> fetchData() async {
      animalFuture = animalsProvider.cargarAnimales();
      setState(() { });
  }

  Widget _crearLista() {
    return FutureBuilder(
      future: animalFuture,
      builder: (BuildContext context, AsyncSnapshot<List<AnimalModel>> snapshot) {
        if (snapshot.hasData) {
          final animals = snapshot.data;
          return ListView.builder(
            controller: _scrollController,
            itemCount: animals!.length,
            itemBuilder: (context, i) => _crearCard(context, animals[i])
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearCard(BuildContext context, AnimalModel animal) {
    return CardAnimalWidget(image: animal.img!, title: animal.name!, type: animal.type, id: animal.id!,);
  }

  
}
