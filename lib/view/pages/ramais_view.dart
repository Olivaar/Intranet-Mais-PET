import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/view/widgets/container_ramais.dart';
import 'package:intranet_maispet/view/widgets/dropButton.dart';
import 'package:intranet_maispet/view/widgets/widget_todos_ramais.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/row_logoMaisPet_nomeDaView.dart';


class BranchesView extends StatefulWidget{

  @override
  _BranchesViewState createState() => _BranchesViewState();

}

class _BranchesViewState extends State<BranchesView>{
  RamalRepository ramalRepository = RamalRepository();
  RamalController ramalController = new RamalController();
  String? unidadeSelecionada;

  @override
  void initState(){
    super.initState();
  }

  Future<void> _carregarRamais(String unidade) async{
    final ramais = await ramalRepository.readListRamalByUnidade(unidade);
    setState(() {
      ramalController.ramais = ramais;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(appBarColor: const Color(0xffFFD200)),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_teste.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: const Color(0xffffffff).withOpacity(0.20),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RowLogoMaisPet_NomeView(nomeDaView: 'Ramais'),

                DropButtonIntranet(
                  onChanged: (value){
                    if(value == 'TODOS OS RAMAIS'){
                      setState(() {
                        unidadeSelecionada = value;
                      });
                    } else{
                      setState(() {
                        unidadeSelecionada = value;
                        _carregarRamais(value);
                      });
                    }
                  },
                  listaDeItens: ramalController.listaDeUnidades,
                  textoHint: 'Selecione a Unidade'
                ),

                if(unidadeSelecionada != null &&
                    unidadeSelecionada != 'TODOS OS RAMAIS')
                  ContainerRamais(
                    ramais: ramalController.ramais, unidade: unidadeSelecionada,
                  ),

                if(unidadeSelecionada != null &&
                    unidadeSelecionada == 'TODOS OS RAMAIS')
                  WidgetTodosRamais(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
