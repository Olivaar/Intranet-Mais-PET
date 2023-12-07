import 'dart:math';

class Comentario{
  String autor;
  DateTime dataPostagem;
  String descricao;
  late String id;

  Comentario({
    required this.autor,
    required this.dataPostagem,
    required this.descricao,
  }) {
    id = Random().nextInt(1000000).toString();
  }

  Comentario.fromJson(Map<String, dynamic> json)
      : autor = json['autor'],
        dataPostagem = json['dataPostagem'],
        descricao = json['descricao'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'autor': autor,
      'dataPostagem': dataPostagem,
      'descricao': descricao,
      'id': id,
    };
  }
}