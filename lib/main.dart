import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String textoResultado = 'Informe os valores';

  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  void _calculoIMC() {
    double altura = double.parse(alturaController.text) / 100;
    double peso = double.parse(pesoController.text);
    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 16) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Magreza grau III';
      } else if (imc < 17) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Magreza grau II';
      } else if (imc < 18.5) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Magreza grau I';
      } else if (imc < 25) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Adequado';
      } else if (imc < 30) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Pré-obeso';
      } else if (imc < 35) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Obesidade grau I';
      } else if (imc < 40) {
        textoResultado = '${imc.toStringAsPrecision(4)} - Obesidade grau II';
      } else {
        textoResultado = '${imc.toStringAsPrecision(4)} - Obesidade grau III';
      }
    });
  }

  void _limpaTela() {
    setState(() {
      alturaController.text = '';
      pesoController.text = '';
      textoResultado = 'Informe os valores';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Seu IMC'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _limpaTela();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_sharp, size: 150, color: Colors.blue),
            TextField(
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.blue, fontSize: 24),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.blue, fontSize: 36),
              keyboardType: TextInputType.number,
              controller: alturaController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Peso',
                labelStyle: TextStyle(color: Colors.blue, fontSize: 24),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.blue, fontSize: 36),
              keyboardType: TextInputType.number,
              controller: pesoController,
            ),
            ElevatedButton(
              child: Text(
                'Calcular',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                _calculoIMC();
              },
            ),
            Text(
              textoResultado,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
