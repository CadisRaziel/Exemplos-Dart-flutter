import 'package:flutter/material.dart';
import 'package:ytclone/Icon/CustomSearchDelegate.dart';
import 'package:ytclone/core/app_controller.dart';
import 'package:ytclone/core/app_images.dart';

//repare nesse import, eu estou importando tudo que eu exportei de dentro de Screen
//se eu nao fizesse isso iria ter 4 imports aqui gerando mais codigo que o necessario
import 'Screens/export.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _isIndice = 0;

  //preciso passar esse resultado no setState e no inicio.dart
  //pois esse resultado vai ser passado para o construtor 'pesquisa' do inicio.dart para passaros ela para
  String? _resultado = '';

  @override
  Widget build(BuildContext context) {


    List<Widget> telas = [Inicio(_resultado!), EmAlta(), Inscricoes(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          AppImages.logo,
          width: 98,
          height: 22,
        ),
        actions: [
          CustomSwitch(),
          //vamos usar async await abaixo pois nao sabemos quanto tempo vai demorar para fazer a pesquisa
          IconButton(onPressed: () async {
            String? res = await showSearch(
              context: context,
               delegate: CustomSearchDelegate()
               );
               setState(() {
                 _resultado = res;
               });
              //  print('Resultado digitado: $res');
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
        //colocando um padding aqui no body, todas as telas vai ter esse mesmo padding
        padding: EdgeInsets.all(16),
        child: telas[_isIndice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //currtentIndex = ele vai selecionar o item que esta e alterar background etc..
        currentIndex: _isIndice,
        onTap: (indice) {
          setState(() {
            _isIndice = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting, //shifiting para podermos colocar um background nos icones e ao clicarmos nele ele vai aparecer a cor que escolhemos
        //fixedColors = define a cor dos icones, porém é usado junto do type: BottonNavigatorType.fixed
        fixedColor: Colors.red,
        items: [
          //Obs: lembre-se de por um backgroundcolor depois dos Icon (exp: Icon(Icons.home), background: Colors.orange) para utilizar como cor de fundo com o BottonNagivationBarType.shifting
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Em Alta', icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: 'Inscrições', icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: 'Biblioteca', icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}

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

/*
USANDO O  BottomNavigationBarType.shifting (ELE È MUITO INTERESSANTE, é legal usar eles em outros app's)
 bottomNavigationBar: BottomNavigationBar(
        //currtentIndex = ele vai selecionar o item que esta e alterar background etc..
        currentIndex: _isIndice, 
        onTap: (indice){
          setState(() {
            _isIndice = indice;
          });
        },        
       type: BottomNavigationBarType.shifting, //shifiting para podermos colocar um background nos icones e ao clicarmos nele ele vai aparecer a cor que escolhemos
        
       items: [
          
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home), backgroundColor: Colors.red),
          BottomNavigationBarItem(label: 'Em Alta', icon: Icon(Icons.whatshot),backgroundColor: Colors.orange),          
          BottomNavigationBarItem(label: 'Inscrições', icon: Icon(Icons.subscriptions),backgroundColor: Colors.blue),          
          BottomNavigationBarItem(label: 'Biblioteca', icon: Icon(Icons.folder), backgroundColor: Colors.green),          
        ],
      ),

      */
