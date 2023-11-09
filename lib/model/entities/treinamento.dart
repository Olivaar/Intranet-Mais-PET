import 'dart:math';

class Treinamento {
  late String titulo;
  late String descricao;
  late List<String> linksVideos;
  String id = Random().nextInt(1000000).toString();

  Treinamento({
    required this.titulo,
    required this.descricao,
    required this.linksVideos,
  });

  Treinamento.fromJson(Map<String, dynamic> json)
    : titulo = json['titulo'],
      descricao = json['descricao'],
      linksVideos = (json['linksVideos'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      id = json['id'];

  Map<String, dynamic> toJson(){
    return{
      'titulo': titulo,
      'descricao': descricao,
      'linksVideos': linksVideos,
      'id': id,
    };
  }
}