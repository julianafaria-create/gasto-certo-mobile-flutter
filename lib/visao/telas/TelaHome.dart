import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/modelo/ItemListView.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';
import 'package:login/visao/util/WidgetsUteis.dart';

class TelaUm extends StatefulWidget {
  const TelaUm({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaUm> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaUm> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1304));

    return Scaffold(
        appBar: AppBar(
          title: Text(Internacionalizacao.titulo),
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
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Internacionalizacao.creditoAtual,
                            style: EstilosTextosCustomizado.formField(context),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'R\$ 55,00',
                            style: EstilosTextosCustomizado.title(context),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Internacionalizacao.valorDisponivel,
                            style: EstilosTextosCustomizado.body(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      Internacionalizacao.linhaGastos,
                      style: EstilosTextosCustomizado.subTitle(context),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 350,
                      width: double.maxFinite,
                      child:
                          WidgetsUteis().listaLinhaTempo(context, linhaTempo),
                    )
                  ],
                ),
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
  ];
}

class Internacionalizacao {
  static String creditoAtual = "Crédito Atual";
  static String valorDisponivel = "valor total ainda disponível";
  static String linhaGastos = "Linha do tempo de gastos";
  static String titulo = "Meu Saldo";
}
