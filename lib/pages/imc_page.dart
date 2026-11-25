// Importa o pacote principal do Flutter
import 'package:flutter/material.dart';
 
// Tela de cálculo de IMC
class ImcPage extends StatefulWidget {
  const ImcPage({super.key});
 
  @override
  State<ImcPage> createState() => _ImcPageState();
}
 
// Classe responsável pelo estado da tela de IMC
class _ImcPageState extends State<ImcPage> {
  // Controllers para capturar peso e altura digitados pelo usuário
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
 
  // Variáveis para exibir o resultado e a classificação
  String resultado = 'Resultado do IMC aparecerá aqui';
  String classificacao = '';
 
  // Método para limpar os campos
  void limparCampos() {
    setState(() {
      pesoController.clear();
      alturaController.clear();
      resultado = 'Resultado do IMC aparecerá aqui';
      classificacao = '';
    });
  }
 
  // Método responsável por calcular o IMC
  void calcularImc() {
    // Converte os textos digitados para números decimais
    double? peso = double.tryParse(pesoController.text);
    double? altura = double.tryParse(alturaController.text);
 
    // Validação dos campos
    if (peso == null || altura == null) {
      setState(() {
        resultado = 'Digite peso e altura válidos.';
        classificacao = '';
      });
      return;
    }
 
    // Verifica se os valores são maiores que zero
    if (peso <= 0 || altura <= 0) {
      setState(() {
        resultado = 'Peso e altura devem ser maiores que zero.';
        classificacao = '';
      });
      return;
    }
 
    // Fórmula do IMC
    double imc = peso / (altura * altura);
 
    // Variável para guardar a classificação do IMC
    String classificacaoImc;
 
    // Verifica a classificação de acordo com o valor do IMC
    if (imc < 18.5) {
      classificacaoImc = 'Abaixo do peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      classificacaoImc = 'Peso normal';
    } else if (imc >= 25.0 && imc <= 29.9) {
      classificacaoImc = 'Sobrepeso';
    } else if (imc >= 30.0 && imc <= 34.9) {
      classificacaoImc = 'Obesidade grau I';
    } else if (imc >= 35.0 && imc <= 39.9) {
      classificacaoImc = 'Obesidade grau II';
    } else {
      classificacaoImc = 'Obesidade grau III';
    }
 
    // Atualiza a tela com o resultado
    setState(() {
      resultado = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
      classificacao = 'Classificação: $classificacaoImc';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior da tela
      appBar: AppBar(
        title: const Text('Cálculo de IMC'),
        centerTitle: true,
      ),
 
      // SingleChildScrollView evita erro caso o teclado ocupe espaço na tela
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.monitor_weight,
                size: 90,
                color: Colors.indigo,
              ),
 
              const SizedBox(height: 20),
 
              const Text(
                'Informe seu peso e sua altura para calcular o IMC.',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
 
              const SizedBox(height: 30),
 
              // Campo para digitar o peso
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso em kg',
                  hintText: 'Exemplo: 70',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fitness_center),
                ),
              ),
 
              const SizedBox(height: 20),
 
              // Campo para digitar a altura
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura em metros',
                  hintText: 'Exemplo: 1.75',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
 
              const SizedBox(height: 30),
 
              // Botão para calcular o IMC
              ElevatedButton(
                onPressed: calcularImc,
                child: const Text(
                  'Calcular IMC',
                  style: TextStyle(fontSize: 18),
                ),
              ),
 
              const SizedBox(height: 15),
 
              // Botão para limpar os campos
              OutlinedButton(
                onPressed: limparCampos,
                child: const Text(
                  'Limpar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
 
              const SizedBox(height: 30),
 
              // Área para exibir o resultado
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo),
                ),
                child: Column(
                  children: [
                    Text(
                      resultado,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
 
                    const SizedBox(height: 10),
 
                    Text(
                      classificacao,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
 
              const SizedBox(height: 30),
 
              // Tabela simples de referência para o aluno visualizar as faixas
              const Text(
                'Tabela de classificação do IMC:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
 
              const SizedBox(height: 10),
 
              const Text(
                'Abaixo de 18,5: Abaixo do peso\n'
                '18,5 até 24,9: Peso normal\n'
                '25,0 até 29,9: Sobrepeso\n'
                '30,0 até 34,9: Obesidade grau I\n'
                '35,0 até 39,9: Obesidade grau II\n'
                'Acima de 40,0: Obesidade grau III',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}