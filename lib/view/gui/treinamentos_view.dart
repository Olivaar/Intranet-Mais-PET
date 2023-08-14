import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';

class TreinamentosView extends StatefulWidget{
   @override
  _TreinamentosViewState createState() => _TreinamentosViewState();
}

class _TreinamentosViewState extends State<TreinamentosView>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarIntranet(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const RowLogoMaisPet_NomeView(nomeDaView: 'TREINAMENTOS'),
                  SizedBox.fromSize(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
}