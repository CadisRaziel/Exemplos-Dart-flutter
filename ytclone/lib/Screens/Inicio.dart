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
  _listarVideos(String pesq) {
    //esse api.pesquisar() é a função criada na api.dart (é a lista aonde retornamos os parametros da api para retornar os videos e apresentar na tela)
    Api api = Api();
    return api.pesquisar(pesq);
  }

  //clico de vida do stateful
  @override
  //1º primeiro metodo que é chamado ao abrir a tela de incio
  //podemos carregar algum dado que queremos utilizar apenas uma unica vez aqui (configurações iniciais da tela)
  void initState() {    
    super.initState();
  }

  @override
  //2º segundo metodo que é chamado ao abrir a tela de inicio
  //aqui eu poderia carregar a lista de videos diretamente aqui
  void didChangeDependencies() {    
    super.didChangeDependencies();
  }

  @override
  //atualiza nossa tela
  //ou quando abrimos uma nova tela ele é chamado tambem (exemp se eu clicar no icone de procurar ele é chamado, se eu clico na seta de voltar ele é chamado)
  //poderia tambem salvar o que o usuario estava fazendo para que quando ele voltar ainda os dados estiver la
  void didUpdateWidget(covariant Inicio oldWidget) {    
    super.didUpdateWidget(oldWidget);
  }

  @override
  //dispose faz o descarte de itens que eu nao quero usar mais
  //quer dizer que quando eu chamar ele, ele vai saber que o inicio.dart nao esta sendo mais usado
  //4º e o ultimo metodo que é chamado (só é executuado quando nao tivermos mais usando a tela inicio.dart)
  //ou seja quando sai da tela de inicio ele automaticamente interrompe processos que poderia pegar muitos recurso de memoria,dados etc..
  void dispose() { 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //3º terceiro metodo que é chamado ao abrir a tela de inicio
    return FutureBuilder(
        future: _listarVideos(widget.pesquisa),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                //instanciando o Video e a List<Video> eu achei mais facil para capturar os parametros !
                List<Video> videos = snapshot.data;
                Video video = videos[index];
  
                //gestureDetector para tanto a imagem quanto o titulo ser clicavel e abrir o video
                return GestureDetector(
                  onTap: (){
                 
                  },
                  child: Column(
                    children: [
                      Container(
                        //esse container vai ser usado para apresentar a imagem de cada video !!
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imagem!))),
                      ),
                      ListTile(
                        //esse ListTIle vai ser usado para apresentar titulo, descricao etc..
                        title: Text(video.titulo!),
                        subtitle: Text(video.canal!),
                      ),
                    ],
                  ),
                );
              },
              //o separator Builder vai fazer o espaçamento entre os containers utilizando uma linha separando um do outro (seria tipo um padding porém é uma linha)
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 2,
                color: Colors.grey,
              ),
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('Nenhum dado a ser exibido'),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
