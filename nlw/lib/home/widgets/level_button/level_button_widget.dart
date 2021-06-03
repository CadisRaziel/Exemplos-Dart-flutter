import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw/core/core.dart';

//aqui criaremos os botões de level o seja, facil, medio, intermediario, expert
class LevelButtonWidget extends StatelessWidget {
  //exportando o botao facil para o usuario utilizar
  //repare na variavel final e repare no required this.label
  final String label;
  LevelButtonWidget({
    //nao esqueça de tirar o "Const" daqui depois que terminas as regras abaixo para nao dar error
    Key? key,
    required this.label,
    //regra para os botões aderirem suas caracteristicas
    //fazendo transições entre botoões ou seja, quando eu clicar em um botão ele vai assumir as caracteristicas dele
  })   : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    },
  };

  Color get color =>
      config[label]!['color']!; //colocamos o ! para dizer que não é nullo
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
        //construindo o botão facil
        decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: borderColor)),
            borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(
            label, //repare que aqui eu troquei o "Fácil" pelo label criado la em cima
            style: GoogleFonts.notoSans(
                //repare que eu nao to pegando o googlefonts que criei no core
                //e sim estou pegando do pubspec que eu setei la, então eu posso usar o metodo do googlefonts diretamente aqui
                //e estiliazr ele !!!
                color: fontColor,
                fontSize: 13),
          ),
        ));
  }
}
