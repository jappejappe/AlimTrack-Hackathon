import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<List<String>> getCardapio() async {
  await dotenv.load();
  print(dotenv.get('API_URL'));

  DateTime now = DateTime.now();
  String currentDay = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  final response = await http.get(
    Uri.parse('${dotenv.get('API_URL')}/api/refeitorio/cardapio/$currentDay'),
    headers: {'Content-Type': 'application/json'},
  );

  final data = jsonDecode(response.body);
  return data["cardapio"];
}

Future<String> postCardapio(lista) async {
  await dotenv.load();
  print(dotenv.get('API_URL'));

  DateTime now = DateTime.now();
  String currentDay = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  final response = await http.post(
    Uri.parse('${dotenv.get('API_URL')}/api/refeitorio/enviar_cardapio/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "cardapio": lista,
      "dia": currentDay
      }),
  );

  final data = jsonDecode(response.body);
  return data["message"];
}
