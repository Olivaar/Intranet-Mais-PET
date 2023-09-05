import 'package:flutter/material.dart';
import 'package:intranet_maispet/control/guiController/treinamento_view_controller.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/dropButton.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';

class TreinamentosView extends StatefulWidget{

   @override
  _TreinamentosViewState createState() => _TreinamentosViewState();

}

class _TreinamentosViewState extends State<TreinamentosView>{
  TreinamentosViewController treinamentosViewController = new TreinamentosViewController();
  late Widget widgetTreinamento;

  @override
  void initState(){
    super.initState();
    widgetTreinamento = Container();
  }

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
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const RowLogoMaisPet_NomeView(nomeDaView: 'TREINAMENTOS'),
                  DropButtonIntranet(
                    onChanged: (value){
                      setState(() {
                        widgetTreinamento = treinamentosViewController.atualizarWidgetTreinamento(value);
                      });
                    },
                    listaDeItens: treinamentosViewController.listaDeTreinamentos,
                    textoHintPesquisar: 'Pesquise o Treinamento...',
                    textoHint: 'Selecione o Treinamento'),
                  widgetTreinamento,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
}