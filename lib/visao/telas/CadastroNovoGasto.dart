import 'package:flutter/material.dart';
import 'package:login/controle/GastoStorage.dart';
import 'package:login/modelo/Objects/gasto.dart';

class CadastroNovoGasto extends StatefulWidget {
  const CadastroNovoGasto({super.key});

  @override
  State<CadastroNovoGasto> createState() => _CadastroNovoGastoState();
}

class _CadastroNovoGastoState extends State<CadastroNovoGasto> {

  final descricaoController = TextEditingController();
  final valorController = TextEditingController();
  final dataController = TextEditingController();
  final categoriaController = TextEditingController();

  void salvarGasto() async {

    if (descricaoController.text.isEmpty ||
        valorController.text.isEmpty ||
        dataController.text.isEmpty ||
        categoriaController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );

      return;
    }

    List<Gasto> gastos = await GastoStorage.carregarGastos();

    Gasto novoGasto = Gasto(
      descricao: descricaoController.text,
      valor: valorController.text,
      data: dataController.text,
      categoria: categoriaController.text,
    );

    gastos.add(novoGasto);

    await GastoStorage.salvarGastos(gastos);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gasto salvo com sucesso'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF4F8F4),

      appBar: AppBar(
        title: Text('Cadastrar gasto'),
        backgroundColor: Color(0xFFE8F5E9),
        foregroundColor: Color(0xFF333333),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: 'Ex: 50,00',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: dataController,
              decoration: InputDecoration(
                labelText: 'Data',
                hintText: 'Ex: 26/08/2026',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: categoriaController,
              decoration: InputDecoration(
                labelText: 'Categoria',
                hintText: 'Ex: Alimentação',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7D32),
                minimumSize: Size(double.infinity, 50),
              ),

              onPressed: salvarGasto,

              child: Text(
                'Salvar gasto',
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