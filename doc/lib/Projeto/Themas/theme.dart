import 'package:flutter/material.dart';

///Se nenhum themefor fornecido, o Flutter criará um tema padrão para você.
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    ///obs: quando eu defino o Theme aqui no MaterialApp ele vai ser fornecido para tudo que estiver no APP

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        ///thema Dark ou Light
        brightness: Brightness.dark,

        ///cor do appBar
        primaryColor: Colors.amberAccent,


        ///cor de background da frase
        accentColor: Colors.purple,

        ///Define a font que sera usada em todo app !!
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        /* textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ), */
      ),
      home: MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),

      ///Olha só que interessante aqui estamos vendo o copyWith, vimos que ele faz a função de sobreescrever uma variavel Porém
      ///ele não reatribui valor a ela, ele cria um novo espaço na memoria com uma nova variavel com o valor reescrito
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
          Theme.of(context).colorScheme.copyWith(secondary: Colors.purple),
        ),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
