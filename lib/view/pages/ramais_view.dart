import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/view/widgets/dropButton.dart';
import 'package:intranet_maispet/view/widgets/row_ramal_view.dart';
import '../../model/entities/ramal.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/row_logoMaisPet_nomeDaView.dart';
import '../widgets/row_ramal_adm.dart';


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
                    setState(() {
                      unidadeSelecionada = value;
                      _carregarRamais(value);
                    });
                  },
                  listaDeItens: ramalController.listaDeUnidades,
                  textoHint: 'Selecione a Unidade'
                ),
                const SizedBox(height: 10,),
                if(unidadeSelecionada != null)
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                    ),
                    width:320,
                    child: Column(
                      children: [
                        Text(
                            unidadeSelecionada ?? 'Selecione uma unidade',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                        ),
                        const Divider(color: Colors.black,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Local',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Ramal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black,),
                      ],
                    ),
                  ),
                if(unidadeSelecionada != null)
                  Container(
                    width: 320,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    ),
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            for(Ramal ramal in ramalController.ramais)
                              Column(
                                children: [
                                  RowRamalView(ramal: ramal),
                                  const SizedBox(height: 2,)
                                ],
                              )
                          ],
                        ),
                      ]
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.print),
      ),
    );
  }
}
