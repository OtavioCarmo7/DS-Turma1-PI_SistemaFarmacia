import 'package:flutter/material.dart';

// Se a sua segunda tela estiver em outro arquivo, importe ela aqui:
// import 'segunda_tela.dart';

class PerfilAlunoPage extends StatelessWidget {
  const PerfilAlunoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do aluno'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.indigo,
            ),
            const SizedBox(height: 16),
            const Text(
              'Ana Souza',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Técnico em desenvolvimento de sistemas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.indigo,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'UC12 - Interface, usabilidade e aplicação mobile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.indigo,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'UC12 - Interface, usabilidade e aplicação mobile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Substitua 'SegundaTela' pelo nome real da sua classe da segunda tela
                  /* 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SegundaTela(),
                    ),
                  );
                  */
                },
                child: const Text('Ver informações'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}