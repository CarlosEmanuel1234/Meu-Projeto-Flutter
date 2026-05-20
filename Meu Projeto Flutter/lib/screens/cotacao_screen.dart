import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CotacaoScreen extends StatefulWidget {
  @override
  _CotacaoScreenState createState() => _CotacaoScreenState();
}

class _CotacaoScreenState extends State<CotacaoScreen> {
  String dolar = "";
  String euro = "";

  void carregar() async {
    var data = await ApiService.getCotacao();

    setState(() {
      dolar = data['USDBRL']['bid'];
      euro = data['EURBRL']['bid'];
    });
  }

  @override
  void initState() {
    super.initState();
    carregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Cotação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            card("Dólar", dolar),
            card("Euro", euro),
          ],
        ),
      ),
    );
  }

  Widget card(String titulo, String valor) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: TextStyle(fontSize: 18)),
          Text("R\$ $valor",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
