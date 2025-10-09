import 'package:alimtrack/logic/cardapio.dart';
import 'package:alimtrack/logic/reservar.dart';
import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({super.key});

  @override
  State<CardapioScreen> createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  late Future<List<String>> items;

  @override
  void initState() {
    super.initState();
    items = getCardapio();
  }

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
                      'CARDÁPIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black87, width: 2),
                    ),
                    child: const Icon(Icons.person, size: 24),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              FutureBuilder<List<String>>(
                future: items,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();  // Exibir carregando
                  }

                  if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Nenhum item encontrado no cardápio');
                  }

                  // Listar os itens do cardápio
                  var cardapio = snapshot.data!;
                  return Column(
                    children: cardapio.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String item = entry.value;

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
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (idx < cardapio.length - 1)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 1,
                              child: Row(
                                children: List.generate(
                                  30,
                                  (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.grey : Colors.transparent,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Botão "Vou almoçar"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await reservar;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8E6D5),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black87, width: 2),
                    ),
                  ),
                  child: const Text(
                    'Vou almoçar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Botão "Não vou almoçar"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação quando "Não vou almoçar" for pressionado
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8E6D5),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black87, width: 2),
                    ),
                  ),
                  child: const Text(
                    'Não vou almoçar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}