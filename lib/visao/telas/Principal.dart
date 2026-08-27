import 'package:flutter/material.dart';
import 'package:login/visao/telas/TelaDeposito.dart';
import 'package:login/visao/telas/TelaTransferencia.dart';
import 'package:login/visao/telas/TelaHome.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //construção da estrutura
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _screens[_currentIndex],
        bottomNavigationBar: _bottomNavigationBar());
  }

  /////////////////////////
  //variáveis
  int _currentIndex = 0;

  List<Widget> _screens = [
    new TelaUm(title: 'Primeira tela'),
    new TelaDois(title: 'Segunda tela'),
    new TelaTres(title: 'Terceira tela')
  ];

  @override
  void initState() {
    _currentIndex = 0;
  }

  //////////////////////////
  //widgets
  //barra de títulos
  AppBar _appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.white70),
          WidgetsUteis().espacoHorizontal5,
          WidgetsUteis().espacoHorizontal5,
          Text(
            Internacionalizacao.titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            // Ação do botão
            print("Sair");
          },
        ),
      ],
    );
  }

  //barra de menu
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex!,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Atualiza o índice
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: Internacionalizacao.opt1,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: Internacionalizacao.opt2,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: Internacionalizacao.opt3,
        ),
      ],
    );
  }
}

class Internacionalizacao {
  static String opt1 = "Inicio";
  static String opt2 = "Depósito";
  static String opt3 = "Transf.";
  static String titulo = "Carteira IFMG";
}
