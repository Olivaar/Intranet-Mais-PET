import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import '../../controller/aniversariante_controller.dart';
import '../../repositories/aniversariante_repository.dart';

class RowAdmAniversariantes extends StatelessWidget {

  Aniversariante aniversariante;
  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  RowAdmAniversariantes({
    super.key,
    required this.aniversariante,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 200,
            child: Text(
              aniversariante.nomeSobrenome,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 5,),

          SizedBox(
            height: 20,
            width: 150,
            child: Text(
              aniversarianteController.dataAniversarioToString(
                aniversariante.dataAniversario,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 5,),

          SizedBox(
            height: 20,
            width: 250,
            child: Text(
              aniversariante.cargo,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 5,),

          SizedBox(
            height: 20,
            width: 200,
            child: Text(
              aniversariante.departamento,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 5,),

          IconButton(
            onPressed: () async{
              aniversarianteRepository.deleteAniversariante(aniversariante.id);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
