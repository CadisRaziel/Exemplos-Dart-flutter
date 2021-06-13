import 'package:flutter/material.dart';

import 'DraggableCard_class.dart';

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(        
        //explicação de como colocamos o child aqui na class 'DraggableCard'
        child: FlutterLogo(
          size: 128
        )
      ),
    );
  }
}