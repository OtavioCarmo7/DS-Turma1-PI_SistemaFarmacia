import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _Segunda_Tela();
}

class _Segunda_Tela extends State<SegundaTela> {
  final TextEditingController _goiabinha = TextEditingController();
  String mensagem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do aluno"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_box,
              size: 200, 
              color: Colors.pink,
            ),

            const SizedBox(height: 100),

            TextField(
              controller: _goiabinha,
              decoration: const InputDecoration(
                labelText: 'Digite uma mensagem', 
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  mensagem = "ola ${_goiabinha.text} seja bem vindo!";
                });
            },
              child: const Text("mostrar imagem"),
            ),
            const SizedBox(height: 24),

            Text(
              mensagem,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
                ),
              
            ),
          
        );
  }
    
  }

