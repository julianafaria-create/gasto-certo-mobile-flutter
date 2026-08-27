import 'package:flutter/material.dart';
import 'package:login/visao/telas/TelaInicioGastoCerto.dart';
import 'package:login/visao/telas/TelaGastosGastoCerto.dart';
import 'package:login/visao/telas/TelaCategoriasGastoCerto.dart';
import 'package:login/visao/telas/TelaPerfilGastoCerto.dart';

class PrincipalGastoCerto extends StatefulWidget {
  const PrincipalGastoCerto({super.key});

  @override
  State<PrincipalGastoCerto> createState() => _PrincipalGastoCertoState();
}

class _PrincipalGastoCertoState extends State<PrincipalGastoCerto> {
  int paginaAtual = 0;

  List<Widget> telas = [
    TelaInicioGastoCerto(),
    TelaGastosGastoCerto(),
    TelaCategoriasGastoCerto(),
    TelaPerfilGastoCerto(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gasto Certo'),
        centerTitle: true,
        backgroundColor: Color(0xFFE8F5E9),
        foregroundColor: Color(0xFF333333),
      ),
      body: telas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        selectedItemColor: Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
