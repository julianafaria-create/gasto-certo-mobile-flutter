import 'package:flutter/material.dart';
import 'package:login/controle/UsuarioStorage.dart';
import 'package:login/visao/telas/PrincipalGastoCerto.dart';

class CadastroGastoCerto extends StatefulWidget {
  const CadastroGastoCerto({super.key});

  @override
  State<CadastroGastoCerto> createState() =>
      _CadastroGastoCertoState();
}

class _CadastroGastoCertoState
    extends State<CadastroGastoCerto> {

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  void cadastrar() async {

    if (nomeController.text.isEmpty ||
        emailController.text.isEmpty ||
        senhaController.text.isEmpty ||
        confirmarSenhaController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );

      return;
    }

    if (senhaController.text !=
        confirmarSenhaController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('As senhas não são iguais'),
        ),
      );

      return;
    }

    await UsuarioStorage.salvarUsuario(
      nomeController.text,
      emailController.text,
      senhaController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cadastro realizado com sucesso'),
      ),
    );

    Future.delayed(Duration(seconds: 1), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrincipalGastoCerto(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF4F8F4),

      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Color(0xFFE8F5E9),
        foregroundColor: Color(0xFF333333),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),

          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),

        child: Column(
          children: [

            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: confirmarSenhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar senha',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7D32),
                minimumSize: Size(double.infinity, 50),
              ),

              onPressed: cadastrar,

              child: Text(
                'Cadastrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}