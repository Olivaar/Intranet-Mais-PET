import 'package:flutter/material.dart';

import '../../control/guiController/ramais_view_controller.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/dropButton.dart';
import '../widgets/row_logoMaisPet_nomeDaView.dart';


class BranchesView extends StatefulWidget{

  @override
  _BranchesViewState createState() => _BranchesViewState();

}

class _BranchesViewState extends State<BranchesView>{
  RamaisViewController ramais_view_controller = new RamaisViewController();

  late Widget widgetListaDeRamais;

  @override
  void initState(){
    super.initState();
    widgetListaDeRamais = Container();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarIntranet(color: const Color(0xffFFD200)),
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
          Container(
            color: const Color(0xffffffff).withOpacity(0.20),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const RowLogoMaisPet_NomeView(nomeDaView: 'RAMAIS'),
                DropButton(
                  onChanged: (value){
                    ramais_view_controller.obterNomeDaUnidade(value);
                    setState(() {
                      widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais(value);
                    });
                  },
                  textoHint: 'Selecione a Unidade',
                  textoHintPesquisar: 'Pesquise a Unidade...',
                  listaDeItens: ramais_view_controller.listaDeUnidades
                ),
                widgetListaDeRamais
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ramais_view_controller.openPdf(context);
        },
        child: Icon(Icons.print),
      ),
    );
  }
}
