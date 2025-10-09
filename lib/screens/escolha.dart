import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EscolhaScreen extends StatefulWidget {
  final String cpfConsumidor; // CPF do usuário logado

  const EscolhaScreen({required this.cpfConsumidor, super.key});

  @override
  State<EscolhaScreen> createState() => _EscolhaScreenState();
}

class _EscolhaScreenState extends State<EscolhaScreen> {
  // Segunda a Domingo
  List<bool> lista = [true, false, true, false, true, false, true];

  Future<void> enviarEscolhas() async {
    await dotenv.load();
    final apiUrl = dotenv.get('API_URL');

    final diasPadrao = {
      "segunda-feira": lista[0] ? 1 : 0,
      "terça-feira": lista[1] ? 1 : 0,
      "quarta-feira": lista[2] ? 1 : 0,
      "quinta-feira": lista[3] ? 1 : 0,
      "sexta-feira": lista[4] ? 1 : 0,
      "sábado": lista[5] ? 1 : 0,
      "domingo": lista[6] ? 1 : 0,
    };

    final body = jsonEncode({
      "cpf_consumidor": widget.cpfConsumidor,
      "dias_padrao": diasPadrao,
    });

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/api/refeitorio/atualizar_dias'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Escolhas enviadas com sucesso!")),
        );
        print(data);
      } else {
        print("Erro: ${response.statusCode}");
        print(response.body);
      }
    } catch (e) {
      print("Erro ao enviar escolhas: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Falha ao enviar escolhas. Verifique a conexão.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final diasDaSemana = [
      "Segunda-feira",
      "Terça-feira",
      "Quarta-feira",
      "Quinta-feira",
      "Sexta-feira",
      "Sábado",
      "Domingo"
    ];

    return Scaffold(
      backgroundColor: Color(0xFFd5d8ba),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              "PERSONALIZAR ESCOLHA",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              "Selecione os dias em que gostaria de manter seu almoço sempre programado.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ...lista.asMap().entries.map((entry) {
              int idx = entry.key;
              bool val = entry.value;
              return Row(
                children: [
                  Switch(
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        lista[idx] = value;
                      });
                    },
                    activeColor: Colors.white,
                    trackColor:
                        MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
                  ),
                  Text(diasDaSemana[idx], style: TextStyle(fontSize: 24)),
                ],
              );
            }).toList(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: enviarEscolhas,
              child: Text("Enviar", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
