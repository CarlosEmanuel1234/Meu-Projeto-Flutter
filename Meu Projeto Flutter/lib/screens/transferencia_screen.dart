import 'package:flutter/material.dart';

class TransferenciaScreen extends StatelessWidget {
  final conta = TextEditingController();
  final valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final saldo = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Transferência"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Saldo atual: R\$ ${saldo.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            TextField(
              controller: conta,
              style: TextStyle(color: Colors.white), // 👈 TEXTO BRANCO
              decoration: InputDecoration(
                labelText: "Conta destino",
                labelStyle:
                    TextStyle(color: Colors.white70), // 👈 LABEL VISÍVEL
                filled: true,
                fillColor: Colors.white10, // 👈 FUNDO DO CAMPO
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            TextField(
              controller: valor,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Valor",
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double valorTransferido = double.tryParse(valor.text) ?? 0;

                if (valorTransferido <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Digite um valor válido")),
                  );
                  return;
                }

                if (valorTransferido > saldo) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Saldo insuficiente")),
                  );
                  return;
                }

                double novoSaldo = saldo - valorTransferido;

                Navigator.pop(context, novoSaldo);
              },
              child: Text("Enviar"),
            )
          ],
        ),
      ),
    );
  }
}
