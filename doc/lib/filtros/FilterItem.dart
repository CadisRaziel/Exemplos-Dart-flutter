import 'package:flutter/material.dart';


///aqui estão os botoes !

@immutable
class FilterItem extends StatelessWidget {
  final Color color;
  final VoidCallback? onFilterSelected;

  FilterItem({
    Key? key,
    required this.color,
    this.onFilterSelected,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,

      ///AspectRatio = a proporção da imagem, podemos deixa-la quadrada - retangular - triangular - arredondada etc...
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.network(
              ///Imagem de fundo dos botões de filtro !
              'https://flutter.dev/docs/cookbook/img-files/effects/instagram-buttons/millenial-texture.jpg',

              ///esse color é a opacidade das cores que cada imagem vai ter !
              color: color.withOpacity(0.5),

              ///colorBlendMode é a transparecencia da imagem referente as cores
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}