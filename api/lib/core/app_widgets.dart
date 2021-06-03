import 'package:api/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}