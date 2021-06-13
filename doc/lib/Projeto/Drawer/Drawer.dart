import 'package:flutter/material.dart';

class ExampleDrawer extends StatefulWidget {
  const ExampleDrawer({ Key? key }) : super(key: key);

  @override
  _ExampleDrawerState createState() => _ExampleDrawerState();
}

class _ExampleDrawerState extends State<ExampleDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body: Center(child: Text('Center Page')),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(child: Text('Titulo do Drawer')),
              ),
              ListTile(
                title: Center(child: Text('Item Nº1')),
                onTap: (){
                  //para fechar o Drawer ao clicar no Texto ou icone ....
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item Nº2'),
                onTap: (){
                  //para fechar o Drawer ao clicar no Texto ou icone ....
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
    );
  }
}