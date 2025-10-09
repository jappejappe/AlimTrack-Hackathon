import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


void reservar() async {
  await dotenv.load();
  print(dotenv.get('API_URL'));
  final response = await http.post(
    Uri.parse('${dotenv.get('API_URL')}/api/refeitorio/reservar/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "matricula": 2023000000,
      "data_reserva": DateTime.now(),
    }),
  );

  final data = jsonDecode(response.body);
  print(data); // TODO: Verificar o status e retornar uma mensagem pro usuário
}