import 'package:flutter/physics.dart' ; 
import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  //crio esse construtor para que no modulo 'image.dart' a classe DraggableCard aceite um widget 'child'
  //se não ao colocar DraggableCard ele não aceitaria o child
  final Widget child;
  DraggableCard({required this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

//Lembre-se o 'with' é um mixin ou seja não é obrigado a resscrever o metodo que esta dentro dele !!
class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {


  //adicionando um controller que vai ser atribuido a função
  //utilizamos o late pois estou dizendo ao dart analyzer que eu garanto que eu vo por um valor nessa variavel
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  //fazendo o widget se mover
  Alignment _dragAlignment = Alignment.center;



  //como o Align não usa pixel ele usa valores de cordenadas precisamos converter pixels em valores de coordenadas nesta função.
  //Pois a animação é em pixel
  //Passamos como parametro o Offset e o size para fazer o calculo !
  void _runAnimation(Offset pixelsPerSeconds, Size size){
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center
      )
    );

    // Calcule a velocidade relativa ao intervalo da unidade, [0,1], (calculo para transformar pixel em cordenadas)
    // usada pelo controlador de animação
    final unitsPerSecondX = pixelsPerSeconds.dx / size.width;
    final unitsPerSecondY = pixelsPerSeconds.dx / size.height;
    final unitsPerSecond = Offset(unitsPerSecondY, unitsPerSecondX);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);

  }

  //aqui eu inicio a animação
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
        _controller.addListener(() {
          setState(() {
            _dragAlignment = _animation.value;
          });
        });
  }

  //e aqui eu encerro a animação
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2));
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}

///Com o MediaQuery conseguimos ter informaçoes sobre o tamanho do dispositivo usado e as preferencias do usuario (fonts)
///com isso conseguimos construir o layout de acordo.
///Obs alem disso ele ve se a tela esta em pé ou deitada e tambem se o usuario alterou a fonte padrao
///Fonte = https://www.youtube.com/watch?v=A3WrA4zAaPw



///onPanUpdate = Um ponteiro que está em contato com a tela com um botão principal e em movimento moveu-se novamente.
///onPanDown = Um ponteiro entrou em contato com a tela com um botão principal e pode começar a se mover.
///onPanEnd = Um ponteiro que estava anteriormente em contato com a tela com um botão principal e em movimento
/// não está mais em contato com a tela e estava se movendo a uma velocidade específica quando parou de entrar em contato com a tela



///O align não usa pixeis ele usa valores de cordenadas [-1,0 -1,0] e [1,0 1,0] e [0,0 0,0] -> representa o centro