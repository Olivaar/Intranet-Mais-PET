import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


import '../../control/guiController/ramais_view_controller.dart';
import 'card_tabela_de_ramais.dart';

class DropButtonRamais extends StatefulWidget {
  DropButtonRamais({super.key});


  @override
  _DropButtonRamaisState createState() => _DropButtonRamaisState();

}

class _DropButtonRamaisState extends State<DropButtonRamais>{

  List<String> listaDeUnidades = [
    '+PET GOIÂNIA',
    '+PET HOLDING',
    '+PET APARECIDA',
    '+PET BRASÍLIA',
    '+PET CAMPINAS',
  ];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  late Widget widgetListaDeRamais;

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    widgetListaDeRamais = Container();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Selecione a Unidade',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: listaDeUnidades
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  atualizarWidgetListaDeRamais();
                },
                buttonStyleData:  ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all( color: Colors.black),
                    color: const Color(0xffFFD200)
                  )
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all( color: Colors.black),
                      color: const Color(0xffFFD200)
                  ),
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Pesquise a Unidade...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
            widgetListaDeRamais
          ],
        )
      ],
    );
  }

  RamaisViewController ramais_view_controller = new RamaisViewController();

  void atualizarWidgetListaDeRamais() {
    if (selectedValue == '+PET GOIÂNIA') {
      setState(() {
        widgetListaDeRamais = CardTabelaDeRamais(
          listaDeRamais: ramais_view_controller.goiania,
          listaDeColunas: ramais_view_controller.myColumns,
          nomeDaUnidade: 'HOSPITAL GOIÂNIA',);
      });
    } else if (selectedValue == '+PET HOLDING') {
      setState(() {
        widgetListaDeRamais = CardTabelaDeRamais(
          listaDeRamais: ramais_view_controller.holding,
          listaDeColunas: ramais_view_controller.myColumns,
          nomeDaUnidade: 'HOLDING',);
      });
    } else if (selectedValue == '+PET APARECIDA') {
      setState(() {
        widgetListaDeRamais = CardTabelaDeRamais(
          listaDeRamais: ramais_view_controller.aparecida,
          listaDeColunas: ramais_view_controller.myColumns,
          nomeDaUnidade: 'PET STORE',);
      });
    } else if (selectedValue == '+PET BRASÍLIA') {
      setState(() {
        widgetListaDeRamais = CardTabelaDeRamais(
          listaDeRamais: ramais_view_controller.brasilia,
          listaDeColunas: ramais_view_controller.myColumns,
          nomeDaUnidade: 'HOSPITAL BRASÍLIA',);
      });
    } else if (selectedValue == '+PET CAMPINAS') {
      setState(() {
        widgetListaDeRamais = CardTabelaDeRamais(
          listaDeRamais: ramais_view_controller.campinas,
          listaDeColunas: ramais_view_controller.myColumns,
          nomeDaUnidade: 'HOSPITAL CAMPINAS',);
      });
    }
  }

}