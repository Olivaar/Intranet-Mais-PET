import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../control/guiController/ramais_view_controller.dart';

class DropButtonRamais extends StatefulWidget {
  final Function(String) onChanged;

  DropButtonRamais({super.key, required this.onChanged});

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
    ramais_view_controller.obterNomeDaUnidade('');
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
                  atualizarWidgetListaDeRamais(selectedValue!);
                  widget.onChanged(value!);
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

  void atualizarWidgetListaDeRamais(String selectedValue) {
    if (selectedValue == '+PET GOIÂNIA') {
      setState(() {
        widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais('+PET GOIÂNIA');
      });
    } else if (selectedValue == '+PET HOLDING') {
      setState(() {
        widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais('+PET HOLDING');
      });
    } else if (selectedValue == '+PET APARECIDA') {
      setState(() {
        widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais('+PET APARECIDA');
      });
    } else if (selectedValue == '+PET BRASÍLIA') {
      setState(() {
        widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais('+PET BRASÍLIA');
      });
    } else if (selectedValue == '+PET CAMPINAS') {
      setState(() {
        widgetListaDeRamais = ramais_view_controller.atualizarCardTableRamais('+PET CAMPINAS');
      });
    }
  }

}