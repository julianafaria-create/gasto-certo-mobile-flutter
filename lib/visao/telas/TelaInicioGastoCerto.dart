import 'package:flutter/material.dart';
import 'package:login/controle/GastoStorage.dart';
import 'package:login/controle/CategoriaStorage.dart';
import 'package:login/modelo/Objects/gasto.dart';

class TelaInicioGastoCerto extends StatefulWidget {
  const TelaInicioGastoCerto({super.key});

  @override
  State<TelaInicioGastoCerto> createState() =>
      _TelaInicioGastoCertoState();
}

class _TelaInicioGastoCertoState
    extends State<TelaInicioGastoCerto> {

  double totalGastos = 0;
  int quantidadeCategorias = 0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {

    List<Gasto> gastos =
    await GastoStorage.carregarGastos();

    List<String> categorias =
    await CategoriaStorage.carregarCategorias();

    double total = 0;

    for (Gasto gasto in gastos) {
      total += double.tryParse(
        gasto.valor.replaceAll(',', '.'),
      ) ??
          0;
    }

    setState(() {
      totalGastos = total;
      quantidadeCategorias = categorias.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Bem-vinda ao Gasto Certo",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Aqui você pode controlar seus gastos de forma simples.",
          ),

          SizedBox(height: 25),

          Card(
            child: ListTile(

              title: Text("Total gasto"),

              subtitle: Text(
                "R\$ ${totalGastos.toStringAsFixed(2).replaceAll('.', ',')}",
              ),

              leading: Icon(
                Icons.attach_money,
                color: Color(0xFF2E7D32),
              ),
            ),
          ),

          Card(
            child: ListTile(

              title: Text("Categorias"),

              subtitle: Text(
                "$quantidadeCategorias cadastradas",
              ),

              leading: Icon(
                Icons.category,
                color: Color(0xFF2E7D32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}