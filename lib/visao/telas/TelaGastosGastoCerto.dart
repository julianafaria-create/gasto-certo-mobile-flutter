import 'package:flutter/material.dart';
import 'package:login/controle/GastoStorage.dart';
import 'package:login/modelo/Objects/gasto.dart';
import 'package:login/visao/telas/CadastroNovoGasto.dart';

class TelaGastosGastoCerto extends StatefulWidget {
  const TelaGastosGastoCerto({super.key});

  @override
  State<TelaGastosGastoCerto> createState() =>
      _TelaGastosGastoCertoState();
}

class _TelaGastosGastoCertoState
    extends State<TelaGastosGastoCerto> {

  List<Gasto> gastos = [];

  @override
  void initState() {
    super.initState();
    carregarGastos();
  }

  Future<void> carregarGastos() async {
    List<Gasto> lista = await GastoStorage.carregarGastos();

    setState(() {
      gastos = lista;
    });
  }

  Future<void> abrirCadastro() async {

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroNovoGasto(),
      ),
    );

    carregarGastos();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [

          Text(
            "Gastos",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2E7D32),
            ),

            onPressed: abrirCadastro,

            child: Text(
              "Cadastrar gasto",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: gastos.isEmpty

                ? Center(
              child: Text(
                'Nenhum gasto cadastrado ainda',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )

                : ListView.builder(
              itemCount: gastos.length,

              itemBuilder: (context, index) {

                Gasto gasto = gastos[index];

                return Card(
                  child: ListTile(

                    title: Text(
                      gasto.descricao,
                    ),

                    subtitle: Text(
                      '${gasto.categoria} - ${gasto.data}',
                    ),

                    trailing: Text(
                      'R\$ ${gasto.valor}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}