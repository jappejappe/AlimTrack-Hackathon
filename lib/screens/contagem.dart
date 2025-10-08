import 'package:flutter/material.dart';

String totalAlunos = "720"; //TODO: Uma função que pegue esse total

class ContagemScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'name': 'Arroz', 'selected': false},
    {'name': 'Feijão', 'selected': false},
    {'name': 'Peixe Frito', 'selected': false},
    {'name': 'Saladas', 'selected': false},
    {'name': 'Frutas', 'selected': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd5d8ba),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                  "ALUNOS CONFIRAMDOS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  totalAlunos,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
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
                      // Checkbox
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          border: Border.all(color: Colors.black87, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Nome do item
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
    );
  }
}
