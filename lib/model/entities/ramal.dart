import 'dart:math';

class Ramal {
  late String unidade;
  late String local;
  late String numero;
  late String id;

  Ramal({
    required this.unidade,
    required this.local,
    required this.numero,
  }) {
    id = Random().nextInt(1000000).toString();
  }

  Ramal.fromJson(Map<String, dynamic> json)
    : local = json['local'],
      numero = json['numero'],
      id = json['id'];

  Map<String, dynamic> toJson(){
    return{
      'local': local,
      'numero': numero,
      'id': id,
    };
  }
}