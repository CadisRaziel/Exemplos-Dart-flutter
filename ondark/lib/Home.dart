import 'package:flutter/material.dart';
import 'package:ondark/app_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerencia de estado global'),
        actions: [
         CustomSwitch()
        ],
      ),
      body: Column(
        children: [
          Text(
            'Realizando a gerencia de estado global. \nOu seja eu tenho uma regra de negocio SEPARADA que é o >app_controller< e estou utilizando ele em 2 Widgets separado porém trabalhando juntas ao mesmo tempo',
            style: TextStyle(
              fontSize: 26,
            ),
          )
        ],
      ),
    );
  }
}


//Separando Widgets
//O nome disso é componetizando Widgets
//ou seja, visa diminuir o codigo separando ele em partes
//como o Switch podemos componetizar nós fazemos isso !s
class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.darkLight,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
