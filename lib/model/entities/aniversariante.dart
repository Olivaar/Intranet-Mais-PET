import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Aniversariante {
  late String nomeSobrenome;
  late Timestamp dataAniversario;
  late String cargo;
  late String unidade;
  late String id;

  Aniversariante({
    required this.nomeSobrenome,
    required this.dataAniversario,
    required this.cargo,
    required this.unidade,
  }) {
    // Gera um ID único aleatório no momento da instanciação
    id = Random().nextInt(1000000).toString(); // Altere o intervalo conforme necessário
  }

  Aniversariante.fromJson(Map<String, dynamic> json)
      : nomeSobrenome = json['nomeSobrenome'],
        dataAniversario = json['dataAniversario'],
        cargo = json['cargo'],
        unidade = json['unidade'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'nomeSobrenome': nomeSobrenome,
      'dataAniversario': dataAniversario,
      'cargo': cargo,
      'unidade': unidade,
      'id': id,
    };
  }

  // Método estático para criar uma instância de Aniversariante a partir de strings
  static Aniversariante fromStrings(
      String nomeSobrenomeStr,
      String dataAniversarioStr,
      String cargoStr,
      String unidadeStr) {
    // Converte a data de aniversário do formato '10/10/2010' para um objeto Timestamp
    final dataAniversarioParts = dataAniversarioStr.split('/');
    if (dataAniversarioParts.length == 3) {
      final day = int.parse(dataAniversarioParts[0]);
      final month = int.parse(dataAniversarioParts[1]);
      final year = int.parse(dataAniversarioParts[2]);

      final dataAniversario = Timestamp.fromDate(DateTime(year, month, day));

      // Crie uma instância de Aniversariante com os valores convertidos
      return Aniversariante(
        nomeSobrenome: nomeSobrenomeStr,
        dataAniversario: dataAniversario,
        cargo: cargoStr,
        unidade: unidadeStr,
      );
    } else {
      throw const FormatException('Formato de data inválido. Use o formato DD/MM/AAAA.');
    }
  }
}
