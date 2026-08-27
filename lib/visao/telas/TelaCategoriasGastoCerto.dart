import 'package:flutter/material.dart';
import 'package:login/controle/CategoriaStorage.dart';

class TelaCategoriasGastoCerto extends StatefulWidget {
  const TelaCategoriasGastoCerto({super.key});

  @override
  State<TelaCategoriasGastoCerto> createState() =>
      _TelaCategoriasGastoCertoState();
}

class _TelaCategoriasGastoCertoState
    extends State<TelaCategoriasGastoCerto> {

  List<String> categorias = [];

  @override
  void initState() {
    super.initState();
    carregarCategorias();
  }

  Future<void> carregarCategorias() async {

    List<String> lista =
    await CategoriaStorage.carregarCategorias();

    setState(() {
      categorias = lista;
    });
  }

  Future<void> adicionarCategoria() async {

    TextEditingController controller =
    TextEditingController();

    await showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: Text('Nova categoria'),

          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Nome da categoria',
              border: OutlineInputBorder(),
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: Text('Cancelar'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E7D32),
              ),

              onPressed: () async {

                if (controller.text.isEmpty) {
                  return;
                }

                categorias.add(controller.text);

                await CategoriaStorage
                    .salvarCategorias(categorias);

                setState(() {});

                Navigator.pop(context);
              },

              child: Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [

          Text(
            "Categorias",

            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2E7D32),
            ),

            onPressed: adicionarCategoria,

            child: Text(
              "Nova categoria",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: categorias.isEmpty

                ? Center(
              child: Text(
                'Nenhuma categoria cadastrada',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )

                : ListView.builder(

              itemCount: categorias.length,

              itemBuilder: (context, index) {

                return Card(
                  child: ListTile(
                    title: Text(
                      categorias[index],
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