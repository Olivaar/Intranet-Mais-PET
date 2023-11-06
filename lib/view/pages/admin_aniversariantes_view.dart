import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/repositories/departamento_repository.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/row_adm_aniversariantes.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import '../../model/entities/departamento.dart';
import '../colors.dart';
import '../widgets/dropButton.dart';
import '../widgets/theme_helper.dart';

class AdminAniversariantesView extends StatefulWidget {
  const AdminAniversariantesView({super.key});

  @override
  State<AdminAniversariantesView> createState() => _AdminAniversariantesViewState();
}

class _AdminAniversariantesViewState extends State<AdminAniversariantesView> {

  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();
  DepartamentoRepository departamentoRepository = DepartamentoRepository();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  String unidadeController = '';



  @override
  void initState() {
    super.initState();
    _carregarAniversariantes();
    _carregarDepartamentos();
  }

  Future<void> _carregarAniversariantes() async {
    final aniversariantes = await aniversarianteRepository.getListAniversariantes();
    setState(() {
      aniversarianteController.aniversariantes = aniversariantes;
    });
  }

  Future<void> _carregarDepartamentos() async {
    final departamentos = await departamentoRepository.readListDepartamentos();
    final List<String> departamentosString = [];
    for(Departamento dep in departamentos){
      departamentosString.add(dep.nome);
    }
    setState(() {
      aniversarianteController.listaDeDepartamentos = departamentosString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(
        appBarColor: azulClaro,
        buttonColor: azulEscuro,
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
            children: [
              const RowLogoMaisPet_NomeView(nomeDaView: 'ADM Aniversariantes'),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 350,
                ),
                child: Container(
                  width: 900,
                  margin: const EdgeInsets.only(left: 175, right: 175),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: azulClaro,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Aniversariante aniversariante in
                      aniversarianteController.aniversariantes)
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RowAdmAniversariantes(
                                aniversariante: aniversariante,
                              ),
                              const SizedBox(width: 6,),
                              IconButton(
                                onPressed: () async{
                                  setState(() {
                                    aniversarianteRepository.deleteAniversariante(
                                      aniversariante.id,
                                    );
                                    _carregarAniversariantes();
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 900,
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(left: 175, right: 175),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: TextFormField(
                        controller: nomeController,
                        decoration: ThemeHelper().textInputDecoration(
                          'Nome',
                          'Nome do Aniversariante...',
                          azulClaro,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6,),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                          DataInputFormatter(),
                        ],
                        controller: dataController,
                        decoration: ThemeHelper().textInputDecoration(
                          'Data',
                          'dd/mm/aaaa',
                          azulClaro,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6,),
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: TextFormField(
                        controller: cargoController,
                        decoration: ThemeHelper().textInputDecoration(
                          'Cargo',
                          'Cargo do Aniversariante...',
                          azulClaro,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6,),
                    DropButtonIntranet(
                      onChanged: (value){
                        unidadeController = value;
                      },
                      listaDeItens: aniversarianteController.listaDeDepartamentos,
                      textoHint: 'Selecione a Unidade',
                      color: azulClaro,
                      width: 190,
                    ),
                    const SizedBox(width: 6,),
                    TextButton(
                      onPressed: () async{
                        Aniversariante an = Aniversariante.fromStrings(
                          nomeController.text,
                          dataController.text,
                          cargoController.text,
                          unidadeController,
                        );
                        setState(() {
                          _carregarAniversariantes();
                        });
                        aniversarianteRepository.saveAniversariante(an);
                        nomeController.clear();
                        dataController.clear();
                        cargoController.clear();
                      },
                      style: ThemeHelper().buttonStyle2(),
                      child: const Text('SALVAR'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              TextButton.icon(
                style: ThemeHelper().buttonStyle2(),
                onPressed: () async{
                  setState(() {
                    for(Aniversariante an in aniversarianteController.aniversariantes){
                      aniversarianteController.deleteAniversariante(an.id);
                    }
                    _carregarAniversariantes();
                  });
                },
                icon: const Icon(Icons.delete),
                label: const Text('LIMPAR LISTA'),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}

class DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
  TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var text = _formatDate(newValue.text);
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  String _formatDate(String input) {
    input = input.replaceAll(RegExp(r'[^0-9]'), ''); // remove caracteres não numéricos

    if (input.length > 2) {
      return '${input.substring(0, 2)}/${input.substring(2, min(4, input.length))}/${input.substring(4, min(8, input.length))}';
    } else {
      return input;
    }
  }
}

