// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/model/customAppBar.dart';
import '../model/categoria.dart';

class CategoriasView extends StatefulWidget {
  const CategoriasView({super.key});

  @override
  State<CategoriasView> createState() => _CategoriasViewState();
}

class _CategoriasViewState extends State<CategoriasView> {
  //atributo
  List<Categoria> lista = [];

  @override
  void initState() {
    lista = Categoria.gerarCategoria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        title: Text(
          'Selecione a Categoria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.orange,
              tooltip: 'Ver seu pedido',
              onPressed: () {
                Navigator.pushNamed(context, 'carrinho');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.orange,
              tooltip: 'Sair',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ), */
      //Única que funcionou
      appBar: CustomAppBar(
        title: 'Selecione a Categoria',
        showCart: true, // O carrinho será exibido
        showLogout: true, // O botão de logout será exibido
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(
                    255, 255, 227, 212), // Começa com uma cor mais clara
                const Color.fromARGB(
                    255, 255, 198, 168), // Termina com uma cor mais escura
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 itens por linha
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    // Retorna o item da lista selecionado
                    var dados = lista[index].catNome;
                    // Navegar para a tela DetalhesView
                    Navigator.pushNamed(context, 'cardapio', arguments: dados);
                  },
                  child: Stack(
                    children: [
                      // Imagem ocupando o botão inteiro
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          lista[index].catImagem,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit
                              .cover, // Para a imagem ocupar todo o espaço
                        ),
                      ),
                      // Texto sobreposto na parte inferior
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(10, 0, 0, 0),
                                const Color.fromARGB(255, 0, 0, 0)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Text(
                            lista[index].catNome,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
