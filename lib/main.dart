import 'package:flutter/material.dart';
import 'package:alimtrack/screens/login.dart';
import 'package:alimtrack/screens/cardapio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardapioScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black)
        )
      ),
      title: "AlimTrack",
      debugShowCheckedModeBanner: false,

      routes: {
        '/login': (context) => LoginScreen(),
        '/cardapio': (context) => CardapioScreen(),
        // Medicine routes
      },
    );
  }
}
