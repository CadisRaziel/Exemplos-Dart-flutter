import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;


///Aqui é onde criaremos cada efeito !

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // Toda a largura de pintura disponível
    final size = context.size.width;

    // A distância que uma única "página" de item assume da perspectiva
    // do sistema de paginação por rolagem. Também usamos este tamanho para a largura e
    // altura de um único item.
    final itemExtent = size / filtersPerScreen;

    // A posição de rolagem atual expressa como uma fração do item, por exemplo, 0,0,
    // ou 1,0, ou 1,3, ou 2,9, etc. Um valor de 1,3 indica que o item em
    // o índice 1 está ativo, e o usuário rolou 30% em direção ao item em
    // índice 2.
    final active = viewportOffset.pixels / itemExtent;

    // Índice do primeiro item que precisamos pintar neste momento.
    // No máximo, pintamos 3 itens à esquerda do item ativo.
    final min = math.max(0, active.floor() - 3).toInt();

    // Índice do último item que precisamos pintar neste momento.
    // No máximo, pintamos 3 itens à direita do item ativo.
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Gere transformações para os itens visíveis e classifique por distância.
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}