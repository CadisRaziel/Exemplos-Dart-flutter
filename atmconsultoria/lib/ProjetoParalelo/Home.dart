import 'package:atmconsultoria/core/app_images.dart';
import 'package:atmconsultoria/core/app_text_style.dart';
import 'package:flutter/material.dart';

class Consultoria extends StatefulWidget {
  @override
  _ConsultoriaState createState() => _ConsultoriaState();
}

class _ConsultoriaState extends State<Consultoria> {
  @override
  //repare que eu tirei o return Scaffold e coloquei ele como child
  //e passei uma função anonima => DefaultTabController
  //e como parametro ele tem o length que é a quantidade de icones que vai ter
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,    
          child: Scaffold(
        appBar: AppBar(
          title: Text('Atm Consultoria', style: AppTextStyles.titleJP),
          centerTitle: true,
          //flexibleSpace para por uma cor gradiente no appbar
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple.shade900, Colors.pink],
                    //begin é aonde vai começar o gradiente
                    begin: Alignment.bottomRight,
                    //end é aonde vai terminar o gradiente
                    end: Alignment.topLeft)),
          ),
          //aqui eu adiciono os icones
          bottom: TabBar(
            //isScrollable = para deixar a os icones com um scroll caso tenha varios
            // isScrollable: true,
            //muda a cor do risco que fica em baixo dos icones
            indicatorColor: Colors.white,
            //deixa a linha que fica em baixo dos icones mais espessa
            indicatorWeight: 3,
            tabs: [
              //tome muito cuidado pois se eu definir LENGTH: 4 ali no incio eu tenho que ter exatamente 4 icones se nao da erro !!! 
              Tab(icon: Icon(Icons.home), text: 'Empresa'),
              Tab(icon: Icon(Icons.home_repair_service_sharp), text: 'Serviços'),
              Tab(icon: Icon(Icons.face), text: 'Clientes'),
              Tab(icon: Icon(Icons.contact_phone), text: 'Contato'),
            ],
          ),
        ),
        body: TabBarView(children: [
          buildPage('Home Page'),
          buildPage('Feed Page'),
          buildPage('Profile Page'),
          buildPage1(context)
        ],),
      ));

      //aqui nos criamos as paginas como widgets !!!!!
      Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ) ,
      );


      //aqui consegumos criar uma pagina estilo o fragmento do kotlin
      //ou seja criamos uma tela a partir do icone criado
      //com isso conseguimos botar um container com todo tipo de conteudo que uma pagina normal teria !!
      Widget buildPage1(BuildContext context) =>  Container( 
        height: double.infinity,
        width: double.infinity,       
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.cliente1),
            fit: BoxFit.fill,
          ),
        ),
    );
      
}
