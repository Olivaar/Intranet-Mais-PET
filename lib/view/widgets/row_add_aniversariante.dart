import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';
import '../../controller/aniversariante_controller.dart';
import '../../model/entities/aniversariante.dart';
import '../../model/entities/departamento.dart';
import '../../repositories/aniversariante_repository.dart';
import '../../repositories/departamento_repository.dart';
import '../colors.dart';
import 'dropButton.dart';

class RowAddAniversariante extends StatefulWidget {
  const RowAddAniversariante({super.key});

  @override
  State<RowAddAniversariante> createState() => _RowAddAniversarianteState();
}

class _RowAddAniversarianteState extends State<RowAddAniversariante> {

  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();
  DepartamentoRepository departamentoRepository = DepartamentoRepository();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  String unidadeController = '';

  Future<void> _carregarDepartamentos() async {
    final departamentos = await departamentoRepository.readListDepartamentos();
    final List<String> departamentosString = [];
    for(Departamento dep in departamentos){
      departamentosString.add(dep.nomeDepartamento);
    }
    setState(() {
      aniversarianteController.listaDeDepartamentos = departamentosString;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _carregarDepartamentos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      padding: const EdgeInsets.all(10),
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
          const SizedBox(width: 5,),

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
          const SizedBox(width: 5,),

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
          const SizedBox(width: 5,),

          DropButtonIntranet(
            onChanged: (value){
              unidadeController = value;
            },
            listaDeItens: aniversarianteController.listaDeDepartamentos,
            textoHint: 'Unidade',
            color: azulClaro,
            width: 180,
          ),
          const SizedBox(width: 5,),

          TextButton(
            onPressed: () async{
              Aniversariante an = Aniversariante.fromStrings(
                nomeController.text,
                dataController.text,
                cargoController.text,
                unidadeController,
              );
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
