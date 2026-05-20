import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double saldo = 2500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Banco Digital"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SALDO
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Saldo disponível",
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 10),
                  Text("R\$ ${saldo.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botao(context, Icons.attach_money, "Cotação", '/cotacao'),
                botao(context, Icons.send, "Transferir", '/transferencia'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget botao(BuildContext context, IconData icon, String texto, String rota) {
    return GestureDetector(
      onTap: () async {
        if (rota == '/transferencia') {
          final novoSaldo = await Navigator.pushNamed(
            context,
            rota,
            arguments: saldo,
          );

          if (novoSaldo != null) {
            setState(() {
              saldo = novoSaldo as double;
            });
          }
        } else {
          Navigator.pushNamed(context, rota);
        }
      },
      child: Container(
        width: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.green),
            SizedBox(height: 10),
            Text(texto),
          ],
        ),
      ),
    );
  }
}
