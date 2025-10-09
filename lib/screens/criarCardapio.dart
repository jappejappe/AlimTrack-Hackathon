import 'package:flutter/material.dart';
import 'package:alimtrack/logic/cardapio.dart';

class Criarcardapio extends StatefulWidget {
  @override
  State<Criarcardapio> createState() => _CriarcardapioState();
}

class _CriarcardapioState extends State<Criarcardapio> {
  final TextEditingController addController = TextEditingController();

  late Future<List<String>> items;
  List<String> cardapio = [];

  @override
  void initState() {
    super.initState();
    items = getCardapio();
    _loadCardapio();
  }

  Future<void> _loadCardapio() async {
    List<String> fetchedCardapio = await getCardapio();
    setState(() {
      cardapio = fetchedCardapio;
    });
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
              FutureBuilder<List<String>>(
                future: items,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Exibir carregando
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
                    children:
                        cardapio.asMap().entries.map((entry) {
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
                                      border: Border.all(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
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
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
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
                  );
                },
              ),

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
                      if (addController.text.isNotEmpty) {
                        setState(() {
                          cardapio.add(addController.text);
                          addController.text = "";
                        });
                      }
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  // Retorna a lista de alimentos
                  // Aqui você pode retornar para a tela anterior com Navigator.pop
                  String message = await postCardapio(cardapio);

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));

                  Navigator.pop(context, cardapio);
                },
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
