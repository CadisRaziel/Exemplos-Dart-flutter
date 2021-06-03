import 'package:flutter/material.dart';

class ChallengeController {
  //para que seja feita a alteração de 0 para 1, 1 para 2 precisamos criar o ValueNotifier!!
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdAnwserRight = 0;
}
