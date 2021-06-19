import 'package:doc/RotasGenerationConst/RotasNomeadas.dart';
import 'package:doc/RotasGenerationConst/homeScreenPage.dart';
import 'package:doc/RotasGenerationConst/settingScreen.dart';
import 'package:doc/RotasGenerationConst/setupFlow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(     
        brightness: Brightness.dark,  
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow.shade900,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow.shade900,
        ),
      ),

        /// eu faço esse sistema de rotas quando eu atribuo seus nomes em constantes
      onGenerateRoute: (settings) {
        ///o page é para eu consegui informar para qual tela 'wiget' ele tem uqe ir
        late Widget page;
        if (settings.name == routeHome) {
          page = HomeScreen();
        } else if (settings.name == routeSettings) {
          page = SettingsScreen();
        } else if (settings.name!.startsWith(routePrefixDeviceSetup)) {
          final subRoute =
              settings.name!.substring(routePrefixDeviceSetup.length);
          page = SetupFlow(
            setupPageRoute: subRoute,
          );
        } else {
          throw Exception('Rota desconhecida: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
