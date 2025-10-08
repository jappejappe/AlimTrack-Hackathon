import 'package:flutter/material.dart';

class Criarcardapio extends StatefulWidget {
  @override
  State<Criarcardapio> createState() => _CriarcardapioState();
}

class _CriarcardapioState extends State<Criarcardapio> {
  final TextEditingController addController = TextEditingController();

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
      backgroundColor: const Color(0xFFE8E6D5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header com título e ícone de perfil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'CARDÁPIO DO DIA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Lista de itens do cardápio
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
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              items.remove(item);
                            });
                          },
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

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: addController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Adicionar Item",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items.add({
                          "name": addController.text,
                          "selected": false,
                        });
                        addController.text = "";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 2.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(1, 50),
                    ),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(300, 60),
                ),
                child: Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
