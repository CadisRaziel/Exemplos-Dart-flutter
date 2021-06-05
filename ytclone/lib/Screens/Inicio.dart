import 'package:flutter/material.dart';
import 'package:ytclone/Data/Api.dart';
import 'package:ytclone/model/video.dart';

class Inicio extends StatefulWidget {
  //para subistituir o construtor que é feito aqui precisamos definir a variavel como final
  //nós criamos esse construtor para que na tela home.dart a tela inicio.dart tenha o parametro(_resultado) que esta criado nela
  final String pesquisa;
  Inicio(this.pesquisa);
  
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesq){

    //esse api.pesquisar() é a função criada na api.dart (é a lista aonde retornamos os parametros da api para retornar os videos e apresentar na tela)
    Api api = Api();
    return api.pesquisar(pesq);
  }


  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
       future: _listarVideos(widget.pesquisa),
       builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index){

                //instanciando o Video e a List<Video> eu achei mais facil para capturar os parametros !  
                List<Video> videos = snapshot.data;
                Video video = videos[index];

                return Column(
                  children: [
                    Container(
                      //esse container vai ser usado para apresentar a imagem de cada video !!
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(video.imagem!)
                        )
                      ),
                    ),
                    ListTile(
                      //esse ListTIle vai ser usado para apresentar titulo, descricao etc..
                      title: Text(video.titulo!),
                      subtitle: Text(video.canal!),
                    ),
                  ],
                );
              }, 
              //o separator Builder vai fazer o espaçamento entre os containers utilizando uma linha separando um do outro (seria tipo um padding porém é uma linha)
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 2,
                color: Colors.grey,
              )  ,
               itemCount: snapshot.data.length,
              );
          } else if(snapshot.hasError) {
            return Container(
              child: Center(child: Text('Nenhum dado a ser exibido'),),
            );
          } else {
            return Center(
              child: CircularProgressIndicator());
          }
       } 
     );
  }
}