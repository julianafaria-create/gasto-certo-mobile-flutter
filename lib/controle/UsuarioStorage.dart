import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioStorage {

  static const String chaveUsuarios = 'usuarios';
  static const String chaveUsuarioAtual = 'usuario_atual';

  static Future<void> salvarUsuario(
      String nome,
      String email,
      String senha) async {

    final prefs = await SharedPreferences.getInstance();

    List<String> usuarios =
        prefs.getStringList(chaveUsuarios) ?? [];

    Map<String, String> novoUsuario = {
      'nome': nome,
      'email': email,
      'senha': senha,
    };

    usuarios.add(jsonEncode(novoUsuario));

    await prefs.setStringList(
      chaveUsuarios,
      usuarios,
    );

    await prefs.setString(
      chaveUsuarioAtual,
      email,
    );
  }

  static Future<Map<String, dynamic>?> fazerLogin(
      String email,
      String senha) async {

    final prefs = await SharedPreferences.getInstance();

    List<String> usuarios =
        prefs.getStringList(chaveUsuarios) ?? [];

    for (String item in usuarios) {

      Map<String, dynamic> usuario =
      jsonDecode(item);

      if (usuario['email'] == email &&
          usuario['senha'] == senha) {

        await prefs.setString(
          chaveUsuarioAtual,
          email,
        );

        return usuario;
      }
    }

    return null;
  }

  static Future<String> carregarEmailAtual() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(chaveUsuarioAtual) ?? '';
  }

  static Future<Map<String, dynamic>?> carregarUsuarioAtual() async {

    final prefs = await SharedPreferences.getInstance();

    String emailAtual =
        prefs.getString(chaveUsuarioAtual) ?? '';

    if (emailAtual.isEmpty) {
      return null;
    }

    List<String> usuarios =
        prefs.getStringList(chaveUsuarios) ?? [];

    for (String item in usuarios) {

      Map<String, dynamic> usuario =
      jsonDecode(item);

      if (usuario['email'] == emailAtual) {
        return usuario;
      }
    }

    return null;
  }
}