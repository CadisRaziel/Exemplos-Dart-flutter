import 'package:flutter/material.dart';

class ButtonDownload extends StatefulWidget {
  //para conseguirmos acessar essa final la na construção da tela precisamos por widget antes
  final Color primaryColor;
  final Color darkPrimaryColor;

  const ButtonDownload({
    Key? key,
    required this.primaryColor,
    required this.darkPrimaryColor,
  }) : super(key: key);

  @override
  _ButtonDownloadState createState() => _ButtonDownloadState();
}

class _ButtonDownloadState extends State<ButtonDownload>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? _scaleAnimationController;
  AnimationController? _fadeAnimationController;

  Animation<double>? _animation;
  Animation<double>? _scaleAnimation;
  Animation<double>? _fadeAnimation;

  double buttonWidth = 200;
  double scale = 1;
  bool animationComplete = false;
  double barColorOpacity = .6;
  bool animationStart = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        //caso na hora de colocar o vsync der erro de 'TickerProviderStateMixin' faça um mixin ao lado do State<ButtonDownload>
        //ou seja vai ficar assim 'class _ButtonDownloadState extends State<ButtonDownload> with TickerProviderStateMixin'
        vsync: this,
        duration: Duration(seconds: 3));

    _scaleAnimationController = AnimationController(
        //caso na hora de colocar o vsync der erro de 'TickerProviderStateMixin' faça um mixin ao lado do State<ButtonDownload>
        //ou seja vai ficar assim 'class _ButtonDownloadState extends State<ButtonDownload> with TickerProviderStateMixin'
        vsync: this,
        duration: Duration(milliseconds: 300));

    _fadeAnimationController = AnimationController(
        //caso na hora de colocar o vsync der erro de 'TickerProviderStateMixin' faça um mixin ao lado do State<ButtonDownload>
        //ou seja vai ficar assim 'class _ButtonDownloadState extends State<ButtonDownload> with TickerProviderStateMixin'
        vsync: this,
        duration: Duration(milliseconds: 400));

    ///_fadeAnimation =  //essa animação vai fazer com que a seta se retire do botão ao ser clicado
    _fadeAnimation =
        Tween<double>(begin: 50.0, end: 0.0).animate(_fadeAnimationController!);

    ///_scaleAnimation = vai fazer o botão ficar maior ao ser clicado !!
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.05).animate(_scaleAnimationController!)
          ..addStatusListener((status) {
            //ao clicar no botão ele vai ficar maior e rapidamente vai voltar ao tamanho normal
            //reverse vai reverter a animação
            if (status == AnimationStatus.completed) {
              _scaleAnimationController!.reverse();
              _fadeAnimationController!.forward();
              _animationController!.forward();
            }
          });

    ///_animation = faz a animação do botão realizando o download vai aparecendo uma barra bem branquinha nele
    ///e quando ele completar ele volta ao normal com as cores
    _animation = Tween<double>(begin: 0.0, end: buttonWidth)
        .animate(_animationController!)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                animationComplete = true;
                barColorOpacity = .0;
              });
            }
          });
  }

  @override
  ///e aqui no dispose nos encerramentos as animações quando elas terminam !
  void dispose(){
    super.dispose();

    _animationController!.dispose();
    _fadeAnimationController!.dispose();
    _scaleAnimationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _scaleAnimationController!,
          builder: (BuildContext context, child) => Transform.scale(
            scale: _scaleAnimation!.value,
            child: InkWell(
              onTap: () {
                /// ao clicar o botão ficara maior
                /// forward = ao começar a animação ele vai até o final dela
                _scaleAnimationController!.forward();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: widget.primaryColor,
                    borderRadius: BorderRadius.circular(3)),
                child: Row(
                  children: [
                    Expanded(
                      //repare no operador ternario abaixo, se a animação ainda estiver falsa ele vai continuar fazendo a animação
                      //caso contrario ela estiver true que terminou ele apresenta o icone de check !
                      child: Align(
                          child: animationComplete == false
                              ? Text(
                                  'Download',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              : Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )),
                    ),
                    AnimatedBuilder(
                      animation: _fadeAnimationController!,
                      //como eu passo o child como parametro, eu posso remover o child: container e só deixar o Container
                      builder: (BuildContext context, child) => Container(
                        //essa animação vai fazer com que a seta se retire do botão ao ser clicado
                        width: _fadeAnimation!.value,
                        height: 50,
                        decoration: BoxDecoration(
                            color: widget.darkPrimaryColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: Icon(Icons.arrow_downward, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          //aqui vai dar a animação da barra branca preenchendo o botão como se estivesse realizando o download !
          animation: _animationController!,
          builder: (BuildContext context, child) => Positioned(
            left: 0,
            top: 0,
            width: _animation!.value,
            height: 50,
            child: AnimatedOpacity(
              opacity: barColorOpacity,
              duration: Duration(milliseconds: 200),
              child: Container(decoration: BoxDecoration(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
