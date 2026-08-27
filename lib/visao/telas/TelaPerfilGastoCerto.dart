import 'package:flutter/material.dart';
import 'package:login/controle/UsuarioStorage.dart';

class TelaPerfilGastoCerto extends StatefulWidget {
  const TelaPerfilGastoCerto({super.key});

  @override
  State<TelaPerfilGastoCerto> createState() =>
      _TelaPerfilGastoCertoState();
}

class _TelaPerfilGastoCertoState
    extends State<TelaPerfilGastoCerto> {

  String nome = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    carregarUsuario();
  }

  Future<void> carregarUsuario() async {

    final usuario =
    await UsuarioStorage.carregarUsuarioAtual();

    if (usuario != null) {

      setState(() {
        nome = usuario['nome'];
        email = usuario['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [

          Text(
            "Perfil",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],

            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),

          SizedBox(height: 20),

          Text(nome),

          Text(email),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2E7D32),
            ),

            onPressed: () {},

            child: Text(
              "Editar perfil",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),

            onPressed: () {},

            child: Text(
              "Excluir conta",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}