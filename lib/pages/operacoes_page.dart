// Importa o pacote principal do Flutter
import 'package:flutter/material.dart';

// Tela de operações matemáticas
class OperacoesPage extends StatefulWidget {
  const OperacoesPage({super.key});

  @override
  State<OperacoesPage> createState() => _OperacoesPageState();
}

// Classe responsável por controlar o estado da tela
class _OperacoesPageState extends State<OperacoesPage> {
  // Controllers são usados para capturar o texto digitado nos TextFields
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  // Variável que armazenará o resultado da operação
  String resultado = 'Resultado aparecerá aqui';

  // Método para limpar os campos
  void limparCampos() {
    setState(() {
      numero1Controller.clear();
      numero2Controller.clear();
      resultado = 'Resultado aparecerá aqui';
    });
  }

  // Método responsável por realizar as operações matemáticas
  void calcular(String operacao) {
    // Converte o texto digitado para número decimal
    // O tryParse evita erro caso o usuário digite texto inválido
    double? numero1 = double.tryParse(numero1Controller.text);
    double? numero2 = double.tryParse(numero2Controller.text);

    // Verifica se os campos foram preenchidos corretamente
    if (numero1 == null || numero2 == null) {
      setState(() {
        resultado = 'Digite dois números válidos.';
      });
      return;
    }

    // Variável que armazenará o cálculo
    double calculo;

    // Estrutura condicional para verificar qual operação foi escolhida
    if (operacao == 'soma') {
      calculo = numero1 + numero2;

      setState(() {
        resultado = 'Resultado da soma: $calculo';
      });
    } else if (operacao == 'subtracao') {
      calculo = numero1 - numero2;

      setState(() {
        resultado = 'Resultado da subtração: $calculo';
      });
    } else if (operacao == 'multiplicacao') {
      calculo = numero1 * numero2;

      setState(() {
        resultado = 'Resultado da multiplicação: $calculo';
      });
    } else if (operacao == 'divisao') {
      // Antes de dividir, verifica se o segundo número é zero
      if (numero2 == 0) {
        setState(() {
          resultado = 'Não é possível dividir por zero.';
        });
      } else {
        calculo = numero1 / numero2;

        setState(() {
          resultado = 'Resultado da divisão: $calculo';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Adicione a interface gráfica (build) da sua página abaixo
    return Scaffold(
      appBar: AppBar(title: const Text('Operações Matemáticas')),
      body: const Center(child: Text('Conteúdo da tela')),
    );
  }
}
