import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';

//modulo para criação do grafico circular !!
class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key, required this.percent}) : super(key: key);
  final double percent;

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin = para ter acesso ao VSYNC para criar animação

  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        //stack é para construir uma pilha
        //ou seja pega os componente e colocar um em cima do outro
        //vamos ter um circulo e vamos por o componente do texto em cima do circulo
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  //quando for por esse Circular tem 3 iguais, escolha o que é um metodo !!
                  child: CircularProgressIndicator(
                    //aumentando a largura
                    strokeWidth: 10,

                    //valor fixo que no casso é a porcentagem do quanto ele ja foi completado (ao invez de deixar ele automatico rodando na tela)
                    value: _animation.value,

                    //colocando cor nele do background e da barra de porcentagem
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),

              //colocando o texto do grafico e centralizando
              Center(
                child: Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        ));
  }
}
