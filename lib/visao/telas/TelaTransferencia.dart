import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class TelaTres extends StatefulWidget {
  const TelaTres({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaTres> createState() => _TelaTresState();
}

class _TelaTresState extends State<TelaTres> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //determinando o tamanho proporção da tela
    ScreenUtil.init(context, designSize: const Size(750, 1304));
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferência de Dinheiro'),
        ),
        body: Container(
          height: double.infinity,
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
            child: SingleChildScrollView(
              child: Column(
                //importante quando usamos listview
                mainAxisSize: MainAxisSize.max,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar Usuário',
                    style: EstilosTextosCustomizado.subTitle(context),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.white70, fontStyle: FontStyle.italic),
                      hintText: 'Digite o nome ou e-mail do usuário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Valor a Transferir',
                    style: EstilosTextosCustomizado.subTitle(context),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Digite o valor',
                      hintStyle: TextStyle(
                          color: Colors.white70, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.monetization_on,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica de transferência
                      },
                      child: Text('Transferir'),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Transferências Realizadas',
                    style: EstilosTextosCustomizado.subTitle(context),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 350, // importante para usarmos lisview
                    width: double.maxFinite,
                    child: WidgetsUteis().listaLinhaTempo(context, linhaTempo),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  List<ItemListView> linhaTempo = [
    ItemListView(dataHora: '10/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
    ItemListView(dataHora: '11/02/2025', valor: 'R50,00'),
  ];
}
