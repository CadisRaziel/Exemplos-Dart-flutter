import 'dart:convert';

import 'package:api_expanded/core/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Post>? parsePost(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  List<Post> post = list.map((model) => Post.fromJson(model)).toList();
  return post;
}

//GET = OBTER(ler)
Future<List<Post>?> fetchPhoto() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    // Use a função compute para executar parsePhotos em um isolado separado.
    return compute(parsePost, response.body);
  } else {
    throw Exception('Resquest API error');
  }
}




