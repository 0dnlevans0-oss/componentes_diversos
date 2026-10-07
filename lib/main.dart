import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {

  bool ligado = false;

  bool? aceito = false;

  double valor = 50.0;

  String opcao = "A";

  void clicarIcone() {
    print("Clicou no coração");
  }

  void alternarSwitch(bool novoValor) {
    setState(() {

      ligado = novoValor;

      print(novoValor);
    });
  }

  void alternarCheckbox(bool? novoValor) {
    setState(() {

      aceito = novoValor;

      print(novoValor);
    });
  }

  void alternarSlider(double novoValor) {
    setState(() {

      valor = novoValor;

      print(novoValor);
    });
  }

  void alternarOpcao(String novaOpcao) {

    setState(() {
      opcao = novaOpcao;
      print(novaOpcao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Galeria de Widgets"),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("IconButton"),

             IconButton(
              icon: Icon(Icons.favorite),
               onPressed: clicarIcone,
             ),

             SizedBox(height: 20),

             Text("Switch"),

             Switch(
              value: ligado,

              onChanged: (valor) {
                alternarSwitch(valor);
              },
             ),

             SizedBox(height: 20),

             Text("Checkbox"),

             Checkbox(
              value: aceito,

              onChanged: (valor) {
                alternarCheckbox(valor!);
              },
             ),

             SizedBox(height: 20),

             Text("Slider: ${valor.toInt()}"),

             Slider(
              min: 0,

              max: 100,

              value: valor,

              onChanged: (novoValor) {
                alternarSlider(novoValor);
              },
             ),

             SizedBox(height: 20),

             Text("SegmentedButton"),

             SegmentedButton<String>(
              segments: [

                ButtonSegment(value: "A", label: Text("Opção A")),
                ButtonSegment(value: "B", label: Text("Opção B")),
                ButtonSegment(value: "C", label: Text("Opção C")),
              ],
              selected: {opcao},

              onSelectionChanged: (novaSelecao) {
                alternarOpcao(novaSelecao.first);

              },
             ),
            ],
          ),
        ),
      ),
    );
  }
}
