import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/visao/estilos/EstilosTexto.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key, required this.title});

  final String title;

  @protected
  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //determinando o tamanho proporção da tela
    ScreenUtil.init(context, designSize: const Size(750, 1304));
    return Scaffold(
        //resizeToAvoidBottomPadding: true,
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
            //Sets the main padding all widgets has to adhere to.
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Depositar',
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
              ],
            ),
          ),
        ));
  }
}
