import 'package:flutter/material.dart';

class ExemploEntradaPage extends StatefulWidget {
  const ExemploEntradaPage({super.key});

  @override
  State<ExemploEntradaPage> createState() => _ExemploEntradaPageState();
}

class _ExemploEntradaPageState extends State<ExemploEntradaPage> {
  final nomeController = TextEditingController();

  String mensagem = 'Digite seu nome no campo abaixo';

  void exibirNome() {
    setState(() {
      mensagem = 'Olá, ${nomeController.text}!';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de dados'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              mensagem,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: exibirNome,
                child: const Text('Exibir nome'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}