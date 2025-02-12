import 'package:flutter/material.dart';
import 'modelos/planeta.dart';
import 'telas/tela_planeta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planetas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Aplicativo - Planeta',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Planeta> _planetas = [];

  @override
  void initState() {
    super.initState();
    _atualizarPlanetas();
  }

  void _atualizarPlanetas() {
    // Lista de planetas (exceto Plutão)
    _planetas = [
      Planeta(
          id: 1,
          nome: 'Mercúrio',
          tamanho: 4879.4,
          distancia: 57909227,
          apelido: 'O mensageiro'),
      Planeta(
          id: 2,
          nome: 'Vênus',
          tamanho: 12104,
          distancia: 108209475,
          apelido: 'A Estrela da Manhã'),
      Planeta(
          id: 3,
          nome: 'Terra',
          tamanho: 12742,
          distancia: 149598023,
          apelido: 'O Planeta Azul'),
      Planeta(
          id: 4,
          nome: 'Marte',
          tamanho: 6779,
          distancia: 227939200,
          apelido: 'O Planeta Vermelho'),
      Planeta(
          id: 5,
          nome: 'Júpiter',
          tamanho: 139820,
          distancia: 778340821,
          apelido: 'O Gigante Gasoso'),
      Planeta(
          id: 6,
          nome: 'Saturno',
          tamanho: 116460,
          distancia: 1426666422,
          apelido: 'O Senhor dos Anéis'),
      Planeta(
          id: 7,
          nome: 'Urano',
          tamanho: 50724,
          distancia: 2870658186,
          apelido: 'O Planeta Gelado'),
      Planeta(
          id: 8,
          nome: 'Netuno',
          tamanho: 49244,
          distancia: 4495080469,
          apelido: 'O Planeta Azul Escuro'),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _planetas.length,
        itemBuilder: (context, index) {
          final planeta = _planetas[index];
          return ListTile(
            title: Text(planeta.nome),
            subtitle: Text(planeta.apelido!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _alterarPlaneta(context, planeta),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _excluirPlaneta(planeta.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incluirPlaneta(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incluirPlaneta(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaPlaneta(
          isIncluir: true,
          planeta: Planeta.vazio(),
          onFinalizado: () {
            _atualizarPlanetas();
          },
        ),
      ),
    );
  }

  void _alterarPlaneta(BuildContext context, Planeta planeta) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaPlaneta(
          isIncluir: false,
          planeta: planeta,
          onFinalizado: () {
            _atualizarPlanetas();
          },
        ),
      ),
    );
  }

  void _excluirPlaneta(int id) async {
    // Aqui você pode implementar a lógica para excluir um planeta.
    // No caso, vamos apenas atualizar a lista.
    setState(() {
      _planetas.removeWhere((planeta) => planeta.id == id);
    });
  }
}
