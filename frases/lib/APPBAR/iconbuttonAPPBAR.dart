import 'package:flutter/material.dart';

class Consultoria extends StatefulWidget {
  @override
  _ConsultoriaState createState() => _ConsultoriaState();
}

class _ConsultoriaState extends State<Consultoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation = para por sompra em baixo do appbar
        elevation: 50,
        //centerTitle = para o titulo ficar no centro do APPBAR
        centerTitle: true,
        //titleSpacing = vai dar espaçamento entre icones e titulo
        titleSpacing: 5,
        //leading coloca icones do lado esquerdo
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        //actions coloca icones do lado direito
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
