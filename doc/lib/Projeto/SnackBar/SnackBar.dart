import 'package:doc/Projeto/SnackBar/SnackBarPage.dart';
import 'package:flutter/material.dart';

class SnackNotification extends StatefulWidget {
  const SnackNotification({ Key? key }) : super(key: key);

  @override
  _SnackNotificationState createState() => _SnackNotificationState();
}

class _SnackNotificationState extends State<SnackNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Notifications'),
      ),
      body: SnackBarPage(),
    );
  }
}