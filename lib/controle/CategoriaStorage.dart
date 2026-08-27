import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/controle/UsuarioStorage.dart';

class CategoriaStorage {

  static Future<String> pegarChave() async {

    String email =
    await UsuarioStorage.carregarEmailAtual();

    return 'categorias_$email';
  }

  static Future<void> salvarCategorias(
      List<String> categorias) async {

    final prefs =
    await SharedPreferences.getInstance();

    String chave = await pegarChave();

    await prefs.setStringList(
      chave,
      categorias,
    );
  }

  static Future<List<String>> carregarCategorias() async {

    final prefs =
    await SharedPreferences.getInstance();

    String chave = await pegarChave();

    return prefs.getStringList(chave) ?? [];
  }
}