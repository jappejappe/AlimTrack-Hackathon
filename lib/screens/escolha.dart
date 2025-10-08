import 'package:flutter/material.dart';

class EscolhaScreen extends StatefulWidget {
  @override
  State<EscolhaScreen> createState() => _EscolhaScreenState();
}

List lista = [true, false, true, false, true, false, true];  //Lista de confirmações programadas

class _EscolhaScreenState extends State<EscolhaScreen> {
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
            Row(
              children: [
                Switch(
                  value: lista[0],
                  onChanged: (value) {
                    setState(() {
                      lista[0] = !lista[0];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Segunda-feira", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[1],
                  onChanged: (value) {
                    setState(() {
                      lista[1] = !lista[1];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Quarta-feira", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[2],
                  onChanged: (value) {
                    setState(() {
                      lista[2] = !lista[2];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Terça-feira", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[3],
                  onChanged: (value) {
                    setState(() {
                      lista[3] = !lista[3];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Quinta-feira", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[4],
                  onChanged: (value) {
                    setState(() {
                      lista[4] = !lista[4];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Sexta-feira", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[5],
                  onChanged: (value) {
                    setState(() {
                      lista[5] = !lista[5];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Sábado", style: TextStyle(fontSize: 32)),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: lista[6],
                  onChanged: (value) {
                    setState(() {
                      lista[6] = !lista[6];
                    });
                  },
                  activeColor: Colors.white,
                  trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                    return Colors.black;
                  }),
                ),
                Text("Domingo", style: TextStyle(fontSize: 32)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
