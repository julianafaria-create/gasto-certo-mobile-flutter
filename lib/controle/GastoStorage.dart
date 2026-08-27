import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/modelo/Objects/gasto.dart';
import 'package:login/controle/UsuarioStorage.dart';

class GastoStorage {

  static Future<String> pegarChave() async {
    String email = await UsuarioStorage.carregarEmailAtual();

    return 'gastos_$email';
  }

  static Future<void> salvarGastos(List<Gasto> gastos) async {

    final prefs = await SharedPreferences.getInstance();

    String chave = await pegarChave();

    List<String> lista = gastos.map((gasto) {
      return jsonEncode(gasto.toMap());
    }).toList();

    await prefs.setStringList(chave, lista);
  }

  static Future<List<Gasto>> carregarGastos() async {

    final prefs = await SharedPreferences.getInstance();

    String chave = await pegarChave();

    List<String> lista =
        prefs.getStringList(chave) ?? [];

    return lista.map((item) {
      return Gasto.fromMap(jsonDecode(item));
    }).toList();
  }
}