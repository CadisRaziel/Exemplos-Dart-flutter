import 'package:flutter/material.dart';

class FAB extends StatefulWidget {
  const FAB({ Key? key }) : super(key: key);

  @override
  _FABState createState() => _FABState();
}

class _FABState extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação do FAB no BottonNAV'),
      ),
      body: Center(
        child: Container(
          child: Text('Olá'),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){},),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(height: 50),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}