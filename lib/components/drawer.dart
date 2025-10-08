import 'package:alimtrack/screens/login.dart';
import 'package:alimtrack/screens/cardapio.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            // só pra alterar o tamanho com o height
            height: 105,
            child: DrawerHeader(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 168, 193, 205)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AlimTrack',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pop(); // fecha qualquer pop-up (hambúrguer tbm)
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),



          // Lista das páginas para navegar durante o desenvolvimento
          ListTile(
            title: const Text('Cardápio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // "animação" padrão de troca de telas
                  builder: (context) => CardapioScreen(), // o que troca de fato a tela, "builda" a tela
                ),
              );
            },
          ),
          
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),

          
        ],
      ),
    );
  }
}
