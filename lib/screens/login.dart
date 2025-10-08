import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Scaffold(
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
        ),
      ),
    );
  }
}
