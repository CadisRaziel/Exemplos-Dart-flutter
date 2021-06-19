import 'dart:convert';
import 'package:flutter/foundation.dart'; //é usada para poder colocar o 'compute'
import 'package:futureyoutube/photo.dart';
import 'package:http/http.dart' as http;

List<Photo>? parsePhoto(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>?> fetchPhoto() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200) {
    // Use a função compute para executar parsePhotos em um isolado separado.
    return compute(parsePhoto, response.body);
  } else {
    throw Exception();
  }
}

//Compute:
/*
Se você executar a fetchPhotos()função em um dispositivo mais lento,
poderá notar que o aplicativo congela por um breve momento enquanto analisa e converte o JSON. Isso é jank, e você quer se livrar dele.

Você pode remover o jank movendo a análise e conversão para um fundo isolado usando a compute() função fornecida pelo Flutter.
A compute()função executa funções caras em um isolamento de segundo plano e retorna o resultado.
Nesse caso, execute a parsePhotos()função em segundo plano.
  */


/*
Notas sobre como trabalhar com isolados
Os isola se comunicam passando mensagens para frente e para trás Estas mensagens podem ser valores primitivos, 
tais como null, num, bool, double, ou String, ou simples objectos, tais como o List<Photo>neste exemplo.

Você pode ter erros se tentar passar objetos mais complexos, como um Future ou http.Response entre isolados.
*/


//Ou seja, o compute cria uma tread separada
//imagine uma tela de app, que esta executando um video e tem um botao que faz uma animação
//ao clicar no botao o video fica rolando no fundo e a animação aparece por cima
//isso tudo esta sendo feita em uma unica thread e vai deixar o app com travamentos
//para podermos separar isso
//nos usamos o 'compute' pois ele cria um thread separado ou seja podemos por um compute no botão
//assim o video vai ter 1 thread para ele e a animação do botão vai ter uma thread separada para ela
//com isso vai evitar o travamento do app !