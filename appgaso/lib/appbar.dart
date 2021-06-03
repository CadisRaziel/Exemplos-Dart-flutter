import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //veja nos actions como eu consigo colcoar icones do lado direito
        title: Text('Álcool ou Gasolina ?'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

//estrutura
//Padding(image),
//Padding(text),
//TextField(),
//TextField(),
//Padding(button)
