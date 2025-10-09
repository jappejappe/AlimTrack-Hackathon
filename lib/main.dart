import 'package:flutter/material.dart';
import 'package:alimtrack/screens/login.dart';
import 'package:alimtrack/screens/cardapio.dart';
import 'package:alimtrack/screens/cadastro.dart';
import 'package:alimtrack/screens/contagem.dart';
import 'package:alimtrack/screens/escolha.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EscolhaScreen(cpfConsumidor: "09253283912"),
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
        '/cadastro': (context) => CadastroScreen(),
        '/contagem': (context) => ContagemScreen(),
        '/escolha': (context) => EscolhaScreen(cpfConsumidor: "09253283912"),
        // Medicine routes
      },
    );
  }
}
