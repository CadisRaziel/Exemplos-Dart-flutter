import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/home/widgets/score_card/score_card_widget.dart';
import 'package:nlw/shared/Models/user_model.dart';

// alterando a classe para ser usado o PreferredSizeWidget
// antes o exteds estava com o StatelessWidget
class AppBarWidget extends PreferredSize {
  //colocando o getuser do controller
  final UserModel user;

  //quando colocarmos o PreferredSize ele pede para criar o construtor abaixo
  AppBarWidget({required this.user}) //colocando o controller
      : super(
          preferredSize: Size.fromHeight(250), //o 250 é em px
          child: Container(
            //colocando tamanho do container
            height: 250,
            child: Stack(
              children: [
                //colocando um texto em uma linha
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  //colocando a cor de gradiente de fundo
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    //definindo a posição do texto
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    //definindo os textos
                    children: [
                      //deiando um texto em bold e outro normal, fazendo isso ele não tem quebra de linha!!!
                      //com o TextSpan podemos criar varias palavras e definir cada uma como bold, linear, etc..
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name, style: AppTextStyles.titleBold)
                          ])),

                      //colocando uma imagem e definindo seu tamanho (vamos por nossa imagem do github)
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          //deixando a imagem com bordas redondas e colocando imagem do github
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(
                                user.photoUrl), //utilizando o controller
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //e aqui abaixo da row colocamos o score_card_widget para ser renderizado
                //e vamos colocar um Align para alinhar ele abaixo do text Olá vitor e a foto
                Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget(
                      percent: user.score / 100,
                    ))
              ],
            ),
          ),
        );
}
