import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget {
  const EmAlta({ Key? key }) : super(key: key);

  @override
  _EmAltaState createState() => _EmAltaState();
}

class _EmAltaState extends State<EmAlta> {
  @override
  Widget build(BuildContext context) {
     return Container(
      child: Center(
        child: Text('Em Alta criado na pasta Screen', style: TextStyle(fontSize: 25),),
      ),
    );
  }
}