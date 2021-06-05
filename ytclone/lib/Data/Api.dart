import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ytclone/model/video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyCqGOl1PdTQY1T7NqObhm3Il1IiqmnVvpg';
const ID_CHANNEL_CANAL = 'UCplT2lzN6MHlVHHLt6so39A';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

//caso precise !
const URL_PESQUISA = 'https://www.googleapis.com/youtube/v3/search';
const URL_PLAYLIST = 'https://www.googleapis.com/youtube/v3/playlists';

class Api {
  Future<List<Video>?> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        //faça nessa ordem com os parametros primeiro ? e depois são todos &
        Uri.parse(URL_BASE + 'search'            
                '?part=snippet'
                '&type=video'
                '&maxResults=20'
                '&order=date'
                '&key=$CHAVE_YOUTUBE_API'
                //'&channelId=$ID_CHANNEL_CANAL' //se eu remover o channelId eu pego os videos da homepage do youtube akeatiruis
                '&q=$pesquisa') //esse pesquisa é quando entramos no canal e ele tem o campo 'pesquisa' repare que não passamos nada de parametro !
        );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = jsonDecode(response.body);

      List<Video> videos = dadosJson['items'].map<Video>(
          //preciso criar esse map para converter para Json
          (map) {
        return Video.fromJson(map);
      }).toList();
      //colocando o return videos aqui eu posso acessa-lo ali dentro do parametro api.pesquisar(''); na tela de inicio
      return videos;
    } else {
      print('Erro data');
    }
  }
}

//Obs: se eu nao passar o channelID ele pega os videos da homepage do youtube e não de um canal especifico

/*
      for(var video in dadosJson['items']){
      print('Resultado $video');
      }
      */

// //Obs: se eu nao passar o channelID ele pega os videos da homepage do youtube e não de um canal especifico

// /*
//       for(var video in dadosJson['items']){
//       print('Resultado $video');
//       }
//       */

// class Api {
//  List<Video> parseVideo(String responseBody) {
//    var list = jsonDecode(responseBody) as List<dynamic>;
//    List<Video> videos = list.map((model) => Video.fromJson(model)).toList();
//    return videos;

// }

//  Future<List<Video>?> fetchVideo() async {
//    final response = await http.get(
//         //faça nessa ordem com os parametros primeiro ? e depois são todos &
//         Uri.parse(URL_BASE +
//             'search'
//                 '?part=snippet'
//                 '&type=video'
//                 '&maxResults=20'
//                 '&order=date'
//                 '&key=$CHAVE_YOUTUBE_API'
//                 //'&channelId=$ID_CHANNEL_CANAL' //se eu remover o channelId eu pego os videos da homepage do youtube (conforme o gosto que eu tenho )
//                 '&q=$list') //esse pesquisa é quando entramos no canal e ele tem o campo 'pesquisa' repare que não passamos nada de parametro !
//         );
//     if (response.statusCode == 200) {
//       return compute(parseVideo, response.body);
//     }else {
//       throw Exception('Data error');
//     }
//  }
// }
