import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Publicacao{
  String titulo;
  String texto;
  String urlImage;
  Timestamp dataPublicacao;
  String id = Random().nextInt(1000000).toString();

  Publicacao({
    required this.titulo,
    required this.texto,
    required this.urlImage,
    required this.dataPublicacao,
  });

  Publicacao.fromJson(Map<String, dynamic> json)
    : titulo = json['titulo'],
      texto = json['descricao'],
      urlImage = json['urlImage'],
      dataPublicacao = json['dataPublicacao'],
      id = json['id'];

  Map<String, dynamic> toJson(){
    return {
      'titulo': titulo,
      'descricao': texto,
      'urlImage': urlImage,
      'dataPublicacao': dataPublicacao,
      'id': id,
    };
  }
}