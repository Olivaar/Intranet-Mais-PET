import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Aniversariante {
  String nomeSobrenome;
  Timestamp dataAniversario;
  String cargo;
  String departamento;
  late String id;

  Aniversariante({
    required this.nomeSobrenome,
    required this.dataAniversario,
    required this.cargo,
    required this.departamento,
  }) {
    id = Random().nextInt(1000000).toString();
  }

  Aniversariante.fromJson(Map<String, dynamic> json)
      : nomeSobrenome = json['nomeSobrenome'],
        dataAniversario = json['dataAniversario'],
        cargo = json['cargo'],
        departamento = json['departamento'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'nomeSobrenome': nomeSobrenome,
      'dataAniversario': dataAniversario,
      'cargo': cargo,
      'departamento': departamento,
      'id': id,
    };
  }

  static Aniversariante fromStrings(
    String nomeSobrenomeStr,
    String dataAniversarioStr,
    String cargoStr,
    String unidadeStr) {
      final dataAniversarioParts = dataAniversarioStr.split('/');

      if (dataAniversarioParts.length == 3) {
        final day = int.parse(dataAniversarioParts[0]);
        final month = int.parse(dataAniversarioParts[1]);
        final year = int.parse(dataAniversarioParts[2]);
        final dataAniversario = Timestamp.fromDate(DateTime(year, month, day));

        return Aniversariante(
          nomeSobrenome: nomeSobrenomeStr,
          dataAniversario: dataAniversario,
          cargo: cargoStr,
          departamento: unidadeStr,
        );
      } else {
        throw const FormatException(
          'Formato de data inválido. Use o formato DD/MM/AAAA.',
        );
      }
  }
}
