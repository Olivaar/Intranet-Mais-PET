import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Publicacao{
  String titulo;
  String descricao;
  String urlImage;
  Timestamp dataPublicacao;
  int likes;
  String id = Random().nextInt(1000000).toString();

  Publicacao({
    required this.titulo,
    required this.descricao,
    required this.urlImage,
    required this.dataPublicacao,
    required this.likes,
  });

  Publicacao.fromJson(Map<String, dynamic> json)
    : titulo = json['titulo'],
      descricao = json['descricao'],
      urlImage = json['urlImage'],
      dataPublicacao = json['dataPublicacao'],
      likes = json['likes'],
      id = json['id'];

  Map<String, dynamic> toJson(){
    return {
      'titulo': titulo,
      'descricao': descricao,
      'urlImage': urlImage,
      'dataPublicacao': dataPublicacao,
      'likes': likes,
      'id': id,
    };
  }
}