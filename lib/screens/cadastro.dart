import 'package:flutter/material.dart';
import 'package:alimtrack/logic/cadastro.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd5d8ba),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView(
          children: [
            Image.asset("../../assets/profile.png", height: 200),
            SizedBox(height: 10),
            Text(
              "CADASTRO",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Nome Completo",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "E-mail",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Senha",
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                cadastrar();
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(1, 60),
              ),
              child: Text("Entrar", style: TextStyle(color: Colors.black, fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
