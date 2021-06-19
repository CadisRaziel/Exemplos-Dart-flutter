import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


 const request = 'https://api.hgbrasil.com/finance?key=f66b3bff';

void main() async {

  // print(await getData());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApi(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return jsonDecode(response.body);
}

class HomeApi extends StatefulWidget {
  const HomeApi({ Key? key }) : super(key: key);

  @override
  _HomeApiState createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Conversor de moeda \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      
    );
  }
}