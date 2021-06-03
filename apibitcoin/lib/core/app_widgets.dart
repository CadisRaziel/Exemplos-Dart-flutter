import 'package:apibitcoin/home.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api BitCoin',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}