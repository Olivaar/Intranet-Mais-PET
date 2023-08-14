import 'package:flutter/material.dart';
import 'package:intranet_maispet/control/guiController/ramais_view_controller.dart';
import 'package:intranet_maispet/view/widgets/card_tabela_de_ramais.dart';

class WidgetTodosRamais extends StatelessWidget{

  RamaisViewController ramaisViewController =  new RamaisViewController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardTabelaDeRamais(
                listaDeRamais: ramaisViewController.goiania,
                listaDeColunas: ramaisViewController.myColumns,
                nomeDaUnidade: 'HOSPITAL GOIÂNIA'
            ),
            CardTabelaDeRamais(
                listaDeRamais: ramaisViewController.brasilia,
                listaDeColunas: ramaisViewController.myColumns,
                nomeDaUnidade: 'HOSPITAL BRASÍLIA'
            ),
            CardTabelaDeRamais(
                listaDeRamais: ramaisViewController.campinas,
                listaDeColunas: ramaisViewController.myColumns,
                nomeDaUnidade: 'HOSPITAL CAMPINAS'
            ),
            CardTabelaDeRamais(
                listaDeRamais: ramaisViewController.aparecida,
                listaDeColunas: ramaisViewController.myColumns,
                nomeDaUnidade: 'PET STORE'
            ),
          ],
        ),
      ],
    );
  }

}