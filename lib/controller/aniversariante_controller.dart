import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import '../model/entities/aniversariante.dart';

class AniversarianteController {
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  List<Aniversariante> aniversariantesDoMes = [];
  List<Aniversariante> aniversariantesDoDia = [];
  List<String> listaDeDepartamentos = [];
  List<String> nomesAniversariantes = [];

  String converterDataAniversarioToString(Timestamp dataAniversario) {
    final dateTime = dataAniversario.toDate();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    return '$day/$month/$year';
  }

  String converterDataAniversarioSemAnoToString(Timestamp dataAniversario) {
    final dateTime = dataAniversario.toDate();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    return '$day/$month';
  }

  Future<void> carregarAniversariantesDoMes() async {
    final aniversariantesDb =
      await aniversarianteRepository.readAniversariantesDoMes();
    aniversariantesDoMes.clear();
    aniversariantesDoMes = aniversariantesDb;
  }

  Future<void> carregarAniversariantesDoDia() async {
    final aniversariantesDoDiaDb = await aniversarianteRepository
        .readAniversariantesDoDia();

    aniversariantesDoDia = aniversariantesDoDiaDb;

    for (Aniversariante an in aniversariantesDoDia) {
      nomesAniversariantes.add(an.nomeSobrenome);
    }
  }

}