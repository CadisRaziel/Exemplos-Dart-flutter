import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Ihul uma notificação do snackBar'),
            action: SnackBarAction(label: 'Ok', onPressed: () {              
            }),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Mostrar SnackBar'),
      ),
    );
  }
}
