import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw/core/core.dart';

//como o botão o estado dele não é alterado ele só faz uma função, nós usamos o stateles
class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  NextButtonWidget(
      {required this.label,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.onTap});

  //criando contrutor nomiavel (o purple vai ser o nome do constuctor)
  NextButtonWidget.purple({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.onTap = onTap,
        this.label = label;

  //criando contrutor nomiavel (o green vai ser o nome do constuctor)
  NextButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.label = label;

  //criando contrutor nomiavel (o white vai ser o nome do constuctor)
  NextButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      //tamanho fixo do botão
      height: 48,
      child: TextButton(
        //estilizando o botão (o botão confirmar vai ficar verde)
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(BorderSide(
              color: borderColor,
            ))),
        onPressed: onTap,
        child: Text(
          label,
          //repare que podemos utilizar o googlefonts graças ao pubspec pois adicionamos a dependencia la
          //repare tambem que nao precisamos usar necessariamente do assets,
          //repare tambem que o Font"W"eight utilizamos w600, w500 padrao do google...
          style: GoogleFonts.notoSans(
            //texto de escrita dentro do botão
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
