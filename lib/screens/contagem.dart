import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContagemScreen extends StatefulWidget {
  @override
  _ContagemScreenState createState() => _ContagemScreenState();
}

class _ContagemScreenState extends State<ContagemScreen> {
  int totalAlunos = 0;
  bool loading = true;

  final List<Map<String, dynamic>> items = [
    {'name': 'Arroz', 'selected': false},
    {'name': 'Feijão', 'selected': false},
    {'name': 'Peixe Frito', 'selected': false},
    {'name': 'Saladas', 'selected': false},
    {'name': 'Frutas', 'selected': false},
  ];

  @override
  void initState() {
    super.initState();
    fetchTotalAlunos();
  }

  Future<void> fetchTotalAlunos() async {
    await dotenv.load();
    final apiUrl = dotenv.get('API_URL');

    try {
      final response = await http.get(
        Uri.parse('$apiUrl/api/refeitorio/reservas/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          totalAlunos = int.parse(response.body);
          loading = false;
        });
      } else {
        print('Erro ao buscar reservas: ${response.statusCode}');
        setState(() => loading = false);
      }
    } catch (e) {
      print('Erro na requisição: $e');
      setState(() => loading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });

    await fetchTotalAlunos();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd5d8ba),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child:
            loading
                ? Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "CONFIRMADOS",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "ALUNOS\nCONFIRMADOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                          Text(
                            '$totalAlunos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      ...items.asMap().entries.map((entry) {
                        int idx = entry.key;
                        Map<String, dynamic> item = entry.value;

                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    border: Border.all(
                                      color: Colors.black87,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (idx < items.length - 1)
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 1,
                                child: Row(
                                  children: List.generate(
                                    30,
                                    (index) => Expanded(
                                      child: Container(
                                        color:
                                            index % 2 == 0
                                                ? Colors.grey
                                                : Colors.transparent,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
      ),
    );
  }
}
