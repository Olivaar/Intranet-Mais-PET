import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import '../../controller/aniversariante_controller.dart';

class RowViewAniversariante extends StatelessWidget {
  Aniversariante aniversariante;
  AniversarianteController aniversarianteController = AniversarianteController();

  RowViewAniversariante({
    super.key,
    required this.aniversariante,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 250,
          child: Text(aniversariante.nomeSobrenome),
        ),
        const SizedBox(width: 6,),
        SizedBox(
          width: 100,
          child: Text(
            aniversarianteController.dataAniversario2ToString(
              aniversariante.dataAniversario,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 6,),
        SizedBox(
          width: 250,
          child: Text(
            aniversariante.cargo,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 6,),
        SizedBox(
          width: 200,
          child: Text(
            aniversariante.departamento,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
