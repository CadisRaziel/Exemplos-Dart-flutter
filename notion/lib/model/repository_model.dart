import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:notion/error/Failure_model.dart';
import 'item_model.dart';

class FinancasNotion {
  static const String _baseURL = 'https://api.notion.com/v1/';

  final http.Client _client;

  //aqui ele vai criar um client e se por padrao nenhum client for passado ele cria um tambem por isso o ??
  FinancasNotion({http.Client? client}) : _client = client ?? http.Client();

  void dispose(){
    //para fechar o client quando chamado (sempre feche os client http quando terminar de usa-los)
    _client.close();
  }

  Future<List<Item>> getItem() async {
    try {
      final url = '${_baseURL}databases/${dotenv.env['NOTION_DATABASE_ID']}/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          //no headers passamos o token de autorização, e a versão da api do notion
          HttpHeaders.authorizationHeader:
          'Bearer ${dotenv.env['NOTION_API_KEY']}',
          'Notion-Version': '2021-05-13',
        },
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => Item.fromMap(e)).toList()
        //para classificar a lista de itens por data em ordem decrescente
          ..sort((a,b) => b.data.compareTo(a.data));
      } else {
        throw const Failure(message: 'Algo deu errado');
      }
    } catch (_) {
        throw const Failure(message: 'Algo deu errado');

    }
  }
}