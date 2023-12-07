import 'dart:math';
import 'package:intranet_maispet/model/enums/sistema_background.dart';
import 'package:intranet_maispet/model/enums/sistema_page.dart';

class Sistema{
  late String nome;
  late String link;
  late String imagem;
  late String urlImage;
  late SistemaBackground sistemaBackground;
  late SistemaPage sistemaPage;
  String id = Random().nextInt(1000000).toString();

  Sistema({
    required this.nome,
    required this.link,
    required this.imagem,
    required this.sistemaBackground,
    required this.sistemaPage,
  });

  Sistema.fromJson(Map<String, dynamic> json)
    : nome = json['nome'],
      link = json['link'],
      imagem = json['imagem'],
      urlImage = json['urlImage'],
      sistemaBackground = SistemaBackground.values
          .firstWhere((bg) => bg.toString() == json['sistemaBackground']),
      sistemaPage = SistemaPage.values
          .firstWhere((page) => page.toString() == json['sistemaPage']),
      id = json['id'];

  Map<String, dynamic> toJson(){
    return {
      'nome': nome,
      'link': link,
      'imagem': imagem,
      'sistemaBackground': sistemaBackground.toString(),
      'sistemaPage': sistemaPage.toString(),
      'id': id,
    };
  }
}