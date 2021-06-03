import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/shared/Models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AwnserWidget({
    Key? key,
    required this.onTap,
    required this.awnser,
    this.isSelected = false,
    this.disabled = false,
  }) : super(key: key);

  //aqui vamos criar propriedades para que quand o usuario clicar na questão e ela estiver correta ou errada
  //a correta vai deixar o fundo esverdiado com as letras verde
  //a incorreta vai deixar o fundo esvermelhado com as cores vermelha

  //se ela tiver certa ou incorreta
  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  //as bordas se estiver certa ou incorreta
  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  //o card se estiver certa ou incorreta
  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  //as bordas se estiver certa ou incorreta
  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  //o texto da pergunta se ela estiver certa ou incorreta
  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  //e o icone que ao clicar vai ficar selecionado ou fechado
  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //esse ignorePointer é para o usuario selecionar apenas uma resposta(ou seja quando ele selecionar uma vai impedir ele de selecionar outras)
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.white))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  //esse expanded nesse Text permite fazer a quebra de linha da pergunta
                  child: Text(
                    awnser.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),

                //colocando botão pra selecionar a pergunta correta
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: isSelected
                          ? _selectedColorRight
                          : AppColors
                              .white, //quando o check ta selecionado muda pra esse cor verde
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(BorderSide(
                          color: isSelected
                              ? _selectedBorderRight
                              : AppColors.white))),
                  child: isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: Colors
                              .white, //quando nao da selecionado o check ele fica branco
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
