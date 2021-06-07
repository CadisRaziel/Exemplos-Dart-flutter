import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:notion/core/app_widget.dart';


//com o .env tornamos nossa main async
void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

