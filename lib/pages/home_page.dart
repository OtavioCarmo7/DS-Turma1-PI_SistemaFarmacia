
import 'package:flutter/material.dart';
import 'produto_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController pesquisaController =
      TextEditingController();

  int quantidadeCarrinho = 0;
  int paginaSelecionada = 0;

  final List<Produto> produtos = [
    const Produto(
      nome: 'Vitamina C',
      descricao: 'Suplemento para imunidade',
      preco: 'R\$ 29,90',
      icone: Icons.medication,
    ),
    const Produto(
      nome: 'Multivitamínico',
      descricao: 'Vitaminas e minerais',
      preco: 'R\$ 45,90',
      icone: Icons.local_pharmacy,
    ),
    const Produto(
      nome: 'Ômega 3',
      descricao: 'Suplemento alimentar',
      preco: 'R\$ 39,90',
      icone: Icons.health_and_safety,
    ),
    const Produto(
      nome: 'Protetor Solar',
      descricao: 'Proteção para sua pele',
      preco: 'R\$ 49,90',
      icone: Icons.spa,
    ),
  ];

  List<Produto> get produtosFiltrados {
    return produtos.where((produto) {
      return produto.nome.toLowerCase().contains(
        pesquisaController.text.toLowerCase(),
      );
    }).toList();
  }

  void adicionarCarrinho() {
    setState(() {
      quantidadeCarrinho++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Produto adicionado ao carrinho!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void abrirPerfil() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Seu perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFF003D7A),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Ainda não tem conta? Cadastre-se!',
                style: TextStyle(
                  color: Color(0xFF003D7A),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('FECHAR'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ENTRAR'),
            ),
          ],
        );
      },
    );
  }

  void abrirCarrinho() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Meu carrinho'),
          content: Text(
            quantidadeCarrinho == 0
                ? 'Seu carrinho está vazio.'
                : '$quantidadeCarrinho produto(s) adicionado(s).',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('FECHAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),

      // CABEÇALHO
      appBar: AppBar(
        backgroundColor: const Color(0xFF001D3A),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.health_and_safety,
              color: Color(0xFF00B4D8),
              size: 32,
            ),
            const SizedBox(width: 8),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SANUS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  'SISTEMAS E TECNOLOGIA',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xFF00B4D8),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: abrirPerfil,
            icon: const Icon(Icons.person_outline),
            tooltip: 'Seu perfil',
          ),

          Stack(
            children: [
              IconButton(
                onPressed: abrirCarrinho,
                icon: const Icon(Icons.shopping_cart_outlined),
              ),

              if (quantidadeCarrinho > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: const Color(0xFF00B4D8),
                    child: Text(
                      '$quantidadeCarrinho',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      // CONTEÚDO DA TELA
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PESQUISA
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: pesquisaController,
                onChanged: (valor) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Buscar medicamento ou receita...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF003D7A),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // BANNER DE PROMOÇÃO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF001D3A),
                      Color(0xFF00549A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00B4D8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'SUPER PROMOÇÃO',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '35% DE\nDESCONTO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'EM PRODUTOS FARMACÊUTICOS E SUPLEMENTOS PARA A SUA SAÚDE E IMUNIDADE',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 18),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          paginaSelecionada = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B4D8),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('EXPLORE AGORA'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            // SERVIÇOS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'NOSSOS SERVIÇOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF001D3A),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  servicoCard(
                    Icons.phone_android,
                    'BAIXE NOSSO APP',
                    'Facilidade na palma da mão',
                  ),

                  servicoCard(
                    Icons.storefront,
                    'RETIRE NA LOJA',
                    'Unidade mais próxima',
                  ),

                  servicoCard(
                    Icons.chat,
                    'WHATSAPP',
                    'Fale com o farmacêutico',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // PRODUTOS EM DESTAQUE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PRODUTOS EM DESTAQUE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF001D3A),
                    ),
                  ),

                  Text(
                    '${produtosFiltrados.length} produtos',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // LISTA DE PRODUTOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: produtosFiltrados.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          'Nenhum produto encontrado.',
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount: produtosFiltrados.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.62,
                      ),
                      itemBuilder: (context, index) {
                        return ProdutoCard(
                          produto: produtosFiltrados[index],
                          onAdicionar: adicionarCarrinho,
                        );
                      },
                    ),
            ),

            const SizedBox(height: 25),

            // RODAPÉ
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              color: const Color(0xFF001D3A),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SANUS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 2,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Sistemas e Tecnologia em Saúde. '
                    'Garantindo segurança e inovação no seu '
                    'atendimento farmacêutico.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    'CONTATO',
                    style: TextStyle(
                      color: Color(0xFF00B4D8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'suporte@sanus.com.br',
                    style: TextStyle(color: Colors.white),
                  ),

                  Text(
                    '(11) 99999-0000',
                    style: TextStyle(color: Colors.white),
                  ),

                  SizedBox(height: 18),

                  Text(
                    '© 2026 SANUS Sistemas e Tecnologia.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // MENU INFERIOR
      bottomNavigationBar: NavigationBar(
        selectedIndex: paginaSelecionada,
        onDestinationSelected: (index) {
          setState(() {
            paginaSelecionada = index;
          });

          if (index == 2) {
            abrirCarrinho();
          } else if (index == 3) {
            abrirPerfil();
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.medication_outlined),
            selectedIcon: Icon(Icons.medication),
            label: 'Produtos',
          ),

          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  // CARD DOS SERVIÇOS
  Widget servicoCard(
    IconData icone,
    String titulo,
    String descricao,
  ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: const Color(0xFF00A4CC),
            size: 30,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color(0xFF003D7A),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
