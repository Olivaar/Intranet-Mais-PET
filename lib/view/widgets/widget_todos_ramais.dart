import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/card_tabela_de_ramais.dart';

class WidgetTodosRamais extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CardTabelaDeRamais(
            //   listaDeRamais: ramaisViewController.goiania,
            //   nomeDaUnidade: 'HOSPITAL GOIÂNIA',
            // ),
            // CardTabelaDeRamais(
            //   listaDeRamais: ramaisViewController.brasilia,
            //   nomeDaUnidade: 'HOSPITAL BRASÍLIA',
            // ),
            // CardTabelaDeRamais(
            //   listaDeRamais: ramaisViewController.campinas,
            //   nomeDaUnidade: 'HOSPITAL CAMPINAS',
            // ),
            // CardTabelaDeRamais(
            //   listaDeRamais: ramaisViewController.aparecida,
            //   nomeDaUnidade: 'PET STORE',
            // ),
          ],
        ),
      ],
    );
  }

}