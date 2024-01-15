import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/model/entities/ramal.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/repositories/departamento_repository.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/dialog_ramal.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/dropButton.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';
import '../widgets/row_ramal_adm.dart';

class AdminRamaisView extends StatefulWidget {
  const AdminRamaisView({super.key});

  @override
  State<AdminRamaisView> createState() => _AdminRamaisViewState();
}

class _AdminRamaisViewState extends State<AdminRamaisView> {

  RamalController ramalController = RamalController();
  RamalRepository ramalRepository = RamalRepository();
  AniversarianteController aniversarianteController = AniversarianteController();
  DepartamentoRepository unidadeRepository = DepartamentoRepository();

  String? unidadeSelecionada;

  @override
  void initState() {
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
      appBar: AppBarIntranet(
        appBarColor: const Color(0xff34B9D6),
        buttonColor: Colors.lightBlue.shade700,
        leading: true,
      ),
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const RowLogoMaisPet_NomeView(nomeDaView: 'ADM Ramais'),

              DropButtonIntranet(
                color: const Color(0xff34B9D6),
                onChanged: (value){
                  setState(() {
                    _carregarRamais(value);
                    unidadeSelecionada = value;
                  });
                },
                listaDeItens: ramalController.listaDeUnidades,
                textoHint: 'Selecione a Unidade'
              ),
              const SizedBox(height: 10,),

              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                ),
                width:470,
                child: Column(
                  children: [
                    Text(
                      unidadeSelecionada ?? 'Selecione uma unidade',
                      textAlign: TextAlign.center,
                      style: ThemeHelper().textStyleAdmRamais(),
                    ),
                    const Divider(color: Colors.black,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Local',
                          textAlign: TextAlign.center,
                          style: ThemeHelper().textStyleAdmRamais(),
                        ),
                        Text(
                          'Ramal',
                          textAlign: TextAlign.center,
                          style: ThemeHelper().textStyleAdmRamais(),
                        ),
                        Text(
                          'Ações',
                          textAlign: TextAlign.center,
                          style: ThemeHelper().textStyleAdmRamais(),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                  ],
                ),
              ),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 320,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  width: 470,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Ramal ramal in ramalController.ramais)
                        Column(
                          children: [
                            Row(
                              children: [
                                RowRamalAdm(
                                  ramal: ramal,
                                  unidadeSelecionada: unidadeSelecionada!,
                                  carregarRamais: _carregarRamais,
                                ),

                                SizedBox(
                                  width: 150,
                                  child: IconButton(
                                    alignment: Alignment.centerRight,
                                    onPressed: (){
                                      ramalController.deleteRamal(
                                        ramal.id,
                                        unidadeSelecionada!
                                      );
                                      setState(() {
                                        _carregarRamais(unidadeSelecionada!);
                                      });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              height: 0.1,
                            ),
                          ],
                        ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialog();
        },
        backgroundColor: const Color(0xff34B9D6),
        child: const Icon(Icons.add),
      ),
      drawer: const DrawerTecnologia(),
    );
  }

  Future<void> _showDialog() async {
    if(unidadeSelecionada != null){
      await showDialog(
          context: context,
          builder: (BuildContext context){
            return DialogRamal(
              unidadeSelecionada: unidadeSelecionada!,
            );
          }
      );
      setState(() {
        _carregarRamais(unidadeSelecionada!);
      });
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text('Selecione uma unidade'),
          );
        }
      );
    }
  }
}
