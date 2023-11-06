import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import '../../controller/aniversariante_controller.dart';

class RowAdmAniversariantes extends StatelessWidget {

  Aniversariante aniversariante;
  AniversarianteController aniversarianteController = AniversarianteController();

  RowAdmAniversariantes({
    super.key,
    required this.aniversariante,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: Text(aniversariante.departamento),
        ),
      ],
    );
  }
}
