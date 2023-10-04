import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/model/entities/unidade.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/repositories/unidade_repository.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/dropButton.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import '../widgets/theme_helper.dart';

class AdminAniversariantesView extends StatefulWidget {
  const AdminAniversariantesView({super.key});

  @override
  State<AdminAniversariantesView> createState() => _AdminAniversariantesViewState();
}

class _AdminAniversariantesViewState extends State<AdminAniversariantesView> {

  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();
  UnidadeRepository unidadeRepository = UnidadeRepository();

  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  String unidadeController = '';

  @override
  void initState() {
    super.initState();
    _carregarAniversariantes();
    _carregarUnidades();
  }

  Future<void> _carregarAniversariantes() async {
    final aniversariantes = await aniversarianteRepository.getListAniversariantes();
    setState(() {
      aniversarianteController.aniversariantes = aniversariantes;
    });
  }

  Future<void> _carregarUnidades() async {
    final unidades = await unidadeRepository.readListUnidades();
    final List<String> unidasdeString = [];
    for(Unidade un in unidades){
      unidasdeString.add(un.nome);
    }
    setState(() {
      aniversarianteController.listaDeUnidades = unidasdeString;
    });
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
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RowLogoMaisPet_NomeView(nomeDaView: 'ADM Aniversariantes'),
                Container(
                  // height: 325,
                  margin: const EdgeInsets.only(left: 175, right: 175),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFD400),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for(Aniversariante aniversariante in aniversarianteController.aniversariantes)
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
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Text(aniversariante.nomeSobrenome),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 150,
                                  child: Text(
                                    aniversarianteController.dataAniversarioToString(
                                      aniversariante.dataAniversario,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 250,
                                  child: Text(aniversariante.cargo),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Text(aniversariante.unidade),
                                ),
                                const SizedBox(width: 6,),
                                IconButton(
                                  onPressed: () async{
                                    setState(() {
                                      aniversarianteRepository.deleteAniversariante(aniversariante.id);
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
                            const Color(0xffFFD400),
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
                            LengthLimitingTextInputFormatter(10), // limita o comprimento para 10 caracteres (dd/mm/aaaa)
                            DataInputFormatter(), // sua classe customizada para formatar a data
                          ],
                          controller: dataController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Data',
                            'dd/mm/aaaa',
                            const Color(0xffFFD400),
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
                            const Color(0xffFFD400),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6,),
                      DropButtonIntranet(
                        onChanged: (value){
                          unidadeController = value;
                        },
                        listaDeItens: aniversarianteController.listaDeUnidades,
                        textoHint: 'Selecione a Unidade',
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
                          setState((){
                            aniversarianteRepository.saveAniversariante(an);
                            _carregarAniversariantes();
                          });
                          nomeController.clear();
                          dataController.clear();
                          cargoController.clear();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFD400)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        child: const Text('SALVAR'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                  ),
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
          ),
        ],
      ),
    );
  }
}

class DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
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
      return input.substring(0, 2) + '/' + input.substring(2, min(4, input.length)) + '/' + input.substring(4, min(8, input.length));
    } else {
      return input;
    }
  }
}

