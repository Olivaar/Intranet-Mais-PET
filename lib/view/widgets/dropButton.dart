import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropButtonIntranet extends StatefulWidget {
  final Function(String) onChanged;
  List<String> listaDeItens;
  String textoHint;
  String textoHintPesquisar;
  Color color;

  DropButtonIntranet({
    super.key,
    required this.onChanged,
    required this.listaDeItens,
    this.textoHintPesquisar = '',
    required this.textoHint,
    this.color = const Color(0xffFFD200),
  });

  @override
  _DropButtonIntranetState createState() => _DropButtonIntranetState();

}

class _DropButtonIntranetState extends State<DropButtonIntranet>{

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
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
                  widget.textoHint,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: widget.listaDeItens
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
                  widget.onChanged(value!);
                },
                buttonStyleData:  ButtonStyleData(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all( color: Colors.black),
                    color: widget.color,
                  )
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all( color: Colors.black),
                    color: widget.color,
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
                        hintText: widget.textoHintPesquisar,
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
          ],
        )
      ],
    );
  }

}