import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/widget_cadastro_treinamento.dart';

import '../widgets/theme_helper.dart';

class PostagemDeTreinamentosView extends StatefulWidget{

  @override
  _PostagemDeTreinamentosView createState() => _PostagemDeTreinamentosView();
}

class _PostagemDeTreinamentosView extends State<PostagemDeTreinamentosView>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarIntranet(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_teste.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetCadastroTreinamento()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}