import 'package:flutter/material.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/telas/Login.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class TelaRecuperacaoSenha extends StatefulWidget {
  @override
  _TelaRecuperacaoSenhaState createState() => _TelaRecuperacaoSenhaState();
}

class _TelaRecuperacaoSenhaState extends State<TelaRecuperacaoSenha> {
  //Função usada ao passar como parâmetro
  telaLogin(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login(title: 'Login')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ação do botão voltar
            },
          ),
          title: Text('Recuperação de Senha'),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorLight
              ])),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-mail',
                  style: EstilosTextosCustomizado.formField(context),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Insira seu e-mail',
                    suffixStyle: EstilosTextosCustomizado.body(context),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Enviaremos um link de recuperação para este e-mail',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 16),
                WidgetsUteis().botaoSemBorda(
                    context: context, texto: 'enviar', executa: () {}),
                SizedBox(height: 46),
                WidgetsUteis().botaoAzulBorda(
                    context: context, texto: 'voltar', executa: telaLogin),
              ],
            ),
          ),
        ));
  }
}
