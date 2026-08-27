import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/telas/Splash2.dart';
import 'package:login/visao/telas/TelaRecuperacaoSenha.dart';
import 'package:login/visao/util/CustomIcons.dart';
import 'package:login/visao/estilos/EstilosBotoes.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/telas/Principal.dart';
import 'package:login/visao/util/SocialIcons.dart';
import 'package:login/visao/util/WidgetsUteis.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/CustomIcons.dart';
import 'package:login/visao/util/SocialIcons.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

bool _entrarActive = false;
bool _cadastrarActive = true;

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _newEmailController = TextEditingController();
TextEditingController _newPasswordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @protected
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Função usada ao passar como parâmetro
  telaPrincipal(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Principal()),
    );
  }

  telaSplash2(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splash2()),
    );
  }

  //Função usada ao passar como parâmetro
  telaRecuperacaoSenha(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaRecuperacaoSenha()),
    );
  }

  //widget painel entrar
  Widget _showEntrar(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(30),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              style: TextStyle(color: Theme.of(context).highlightColor),
              controller: _emailController,
              decoration: InputDecoration(
                hintText: Internacionalizacao.hintTextEmail,
                hintStyle: EstilosTextosCustomizado.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).highlightColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).highlightColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(50),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              obscureText: true,
              style: TextStyle(color: Theme.of(context).highlightColor),
              controller: _passwordController,
              decoration: InputDecoration(
                //Add th Hint text here.
                hintText: Internacionalizacao.hintTextPassword,
                hintStyle: EstilosTextosCustomizado.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: EstilosBotoes().borderSideFino(context)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: EstilosBotoes().borderSideFino(context)),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(80),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          // Adicionei padding diretamente no Container
          child: WidgetsUteis().botaoSemBorda(
              context: context, texto: 'Acessar', executa: telaSplash2),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(15),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WidgetsUteis().horizontalLine(),
                Text('-', style: EstilosTextosCustomizado.body(context)),
                WidgetsUteis().horizontalLine()
              ],
            ),
          ),
        ),
        WidgetsUteis().espacoHorizontal15,

        //trabalhando com a componentização de widgets
        WidgetsUteis().botaoAzulBorda(
            context: context,
            texto: "Esqueci minha senha...",
            executa: telaRecuperacaoSenha),
      ],
    );
  }

  //widget painel cadastrar
  Widget _showCadastrar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(30),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          // Adicionei padding diretamente no Container para simplificar
          child: TextField(
            obscureText: false,
            style: EstilosTextosCustomizado.formField(context),
            controller: _newEmailController,
            decoration: InputDecoration(
              hintText: Internacionalizacao.hintTextNewEmail,
              // Adicionado o texto sugerido
              hintStyle: EstilosTextosCustomizado.formField(context),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary, // Substituí "accentColor" (obsoleto)
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary, // Atualização para a nova API de temas
                  width: 1.0,
                ),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white, // Ícone estilizado
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(50),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              obscureText: true,
              style: EstilosTextosCustomizado.formField(context),
              controller: _newPasswordController,
              decoration: InputDecoration(
                //Add the Hint text here.
                hintText: Internacionalizacao.hintTextNewPassword,
                hintStyle: EstilosTextosCustomizado.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).highlightColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).highlightColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(80),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                // Define a cor de fundo
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                // Espaçamento interno
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Bordas arredondadas para modernização do design
                ),
              ),
              onPressed: () {
                //regras de negócio
                telaSplash2(context);
              }, // Função ao clicar no botão
              child: Text(
                Internacionalizacao.signUpMenuButton, // Texto do botão
                style: EstilosTextosCustomizado.button(
                    context), // Estilo personalizado
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //define a tela como preferência em pé
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //determinando o tamanho proporção da tela
    ScreenUtil.init(context, designSize: const Size(750, 1304));

    return Scaffold(
        resizeToAvoidBottomInset: true,
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
            padding: EdgeInsets.only(top: 40.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(Internacionalizacao.logoTitle,
                              style: EstilosTextosCustomizado.title(context)),
                          Text(
                            Internacionalizacao.logoSubTitle,
                            style: EstilosTextosCustomizado.subTitle(context),
                          ),
                        ],
                      )),
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(190),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(60),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          OutlinedButton(
                            onPressed: () =>
                                setState(() => _alterarParaEntrar()),
                            child: new Text(
                                Internacionalizacao.signInMenuButton,
                                style: _cadastrarActive
                                    ? TextStyle(
                                        fontSize: 22,
                                        color: Theme.of(context).highlightColor,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).highlightColor,
                                        fontWeight: FontWeight.normal)),
                          ),
                          OutlinedButton(
                            onPressed: () =>
                                setState(() => _alterarParaCadastrar()),
                            child: Text(Internacionalizacao.signUpMenuButton,
                                style: _entrarActive
                                    ? TextStyle(
                                        fontSize: 22,
                                        color: Theme.of(context).highlightColor,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).highlightColor,
                                        fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                    ),
                  ),
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(170),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Container(
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: _cadastrarActive
                          ? _showEntrar(context)
                          : _showCadastrar()),
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(778),
                ),
              ],
            ),
          ),
        ));
  }

  static void _alterarParaCadastrar() {
    _entrarActive = true;
    _cadastrarActive = false;
  }

  static void _alterarParaEntrar() {
    _entrarActive = false;
    _cadastrarActive = true;
  }
}

class Internacionalizacao {
  static String logoTitle = "TITULO DA APP";
  static String logoSubTitle = "SUBTÍTULO";
  static String signInMenuButton = "ACESSAR";
  static String signUpMenuButton = "CADASTRAR";
  static String hintTextEmail = "Email";
  static String hintTextPassword = "Senha";
  static String hintTextNewEmail = "Enntre com seu Email";
  static String hintTextNewPassword = "Crie uma senha";
}
