import 'package:flutter/material.dart';

class MyOrientation extends StatelessWidget {
  const MyOrientation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deitado - EmPé'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(50, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  //o style abaixo coloca uma fonte do Theme e o headline1-2-3-4-5 diminui o FontSize
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
