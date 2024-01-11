import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';

import '../model/entities/aniversariante.dart';

class AniversarianteController {
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  List<Aniversariante> aniversariantes = [];
  List<Aniversariante> aniversariantesDoDia = [];
  List<String> listaDeDepartamentos = [];

  String dataAniversarioToString(Timestamp dataAniversario) {
    final dateTime = dataAniversario.toDate();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    return '$day/$month/$year';
  }

  String dataAniversario2ToString(Timestamp dataAniversario) {
    final dateTime = dataAniversario.toDate();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    return '$day/$month';
  }

  Future<void> carregarAniversariantes() async {
    final aniversariantesDb =
      await aniversarianteRepository.getListAniversariantes();
    aniversariantes.clear();
    aniversariantes = aniversariantesDb;
  }

  Future<void> carregarAniversariantesDoDia() async {
    final aniversariantesDoDiaDb =
      await aniversarianteRepository.getAniversariantesDoDia();
    aniversariantesDoDia.clear();
    aniversariantesDoDia = aniversariantesDoDiaDb;
  }

}