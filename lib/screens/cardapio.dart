import 'package:flutter/material.dart';
import 'package:alimtrack/components/drawer.dart' as menu;

class CardapioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 168, 193, 205),
        centerTitle: true,
        title: const Text("", style: TextStyle(fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.black)),

      drawer: menu.Menu(),
      body: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            Icon(Icons.circle, size: 200),
            SizedBox(height: 10),
            Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: "Matrícula/CPF",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Senha",
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: Text("Entrar")),
          ],
        ),
      ));
  }
}
