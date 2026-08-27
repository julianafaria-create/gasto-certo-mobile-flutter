import 'package:flutter/material.dart';
import 'package:login/controle/UsuarioStorage.dart';
import 'package:login/visao/telas/PrincipalGastoCerto.dart';
import 'package:login/visao/telas/CadastroGastoCerto.dart';

class LoginGastoCerto extends StatefulWidget {
  const LoginGastoCerto({super.key});

  @override
  State<LoginGastoCerto> createState() =>
      _LoginGastoCertoState();
}

class _LoginGastoCertoState
    extends State<LoginGastoCerto> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void entrar() async {

    if (emailController.text.isEmpty ||
        senhaController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha o e-mail e a senha'),
        ),
      );

      return;
    }

    final usuario = await UsuarioStorage.fazerLogin(
      emailController.text,
      senhaController.text,
    );

    if (usuario != null) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrincipalGastoCerto(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-mail ou senha incorretos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF4F8F4),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),

          child: Column(
            children: [

              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,

                child: Padding(
                  padding: EdgeInsets.all(6),

                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Gasto Certo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Controle seus gastos de forma simples',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 30),

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

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E7D32),
                  minimumSize: Size(double.infinity, 50),
                ),

                onPressed: entrar,

                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CadastroGastoCerto(),
                    ),
                  );

                },

                child: Text(
                  'Não tem conta? Cadastre-se',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}