import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';

import '../model/entities/aniversariante.dart';

class AniversarianteController {
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();
  List<Aniversariante> aniversariantes = [];
  List<Aniversariante> aniversariantesDoDia = [];
  List<String> listaDeUnidades = [];

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

  Aniversariante createAniversariante(String nome, String data, String cargo, String unidade){
    Aniversariante aniversariante = Aniversariante.fromStrings(
        nome, data, cargo, unidade,
    );
    aniversarianteRepository.saveAndUpdateAniversariante(aniversariante);
    return aniversariante;
  }

  void updateAniversariente(String id, Aniversariante aniversariante){
    aniversarianteRepository.updateAniversariante(id, aniversariante);
  }

  void deleteAniversariante(String id){
    aniversarianteRepository.deleteAniversariante(id);
  }

  String selectUnidade(String value){
    String unidade = value;
    return unidade;
  }
}