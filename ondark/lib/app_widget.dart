import 'package:flutter/material.dart';
import 'package:ondark/Home.dart';
import 'package:ondark/app_controllTheme.dart';
import 'package:ondark/app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  get animation => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (contex, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: ColorWhite.white, //<----------------------------------------
            brightness: AppController.instance.darkLight 
            ? Brightness.dark 
            : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}
