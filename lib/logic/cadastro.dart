import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


void cadastrar() async {
  await dotenv.load();
  print(dotenv.get('API_URL'));
  final response = await http.post(
    Uri.parse('${dotenv.get('API_URL')}/api/refeitorio/cadastrar'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "nome_consumidor": "Fulano",
      "matricula": null,
      "cpf_consumidor": null,
      "senha": "123",
      "dias_padrao":
          "{\"segunda\": 0, \"terça\": 0, \"quarta\": 0, \"quinta\": 0, \"sexta\": 0, \"sábado\": 0, \"domingo\": 0}",
    }),
  );

  final data = jsonDecode(response.body);
  print(data); // TODO: Verificar o status e retornar uma mensagem pro usuário
}
