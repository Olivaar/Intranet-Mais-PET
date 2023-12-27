import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/enums/sistema_background.dart';
import '../../model/enums/sistema_page.dart';

class CardAbrirSistemas extends StatelessWidget{

  final String nomeDoSistema;
  final String urlDoSistema;
  final String urlImage;
  SistemaBackground sistemaBackground;
  SistemaPage sistemaPage;

  CardAbrirSistemas ({
    super.key,
    required this.urlDoSistema,
    required this.urlImage,
    required this.nomeDoSistema,
    required this.sistemaBackground,
    required this.sistemaPage,
  });

 Color _backGroundColor(){
    late Color backGroundColor;
    if(sistemaBackground == SistemaBackground.normal) backGroundColor = branco;
    if(sistemaBackground == SistemaBackground.maispet) backGroundColor = amareloClaro;
    if(sistemaBackground == SistemaBackground.telemed) backGroundColor = azulClaro;
    return backGroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _backGroundColor(),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          if(await canLaunchUrl(Uri.parse(urlDoSistema))){
            await launchUrl(Uri.parse(urlDoSistema));
          }else{
            throw 'Não foi possível abrir o site $urlDoSistema';
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Row(
                children: <Widget> [
                  Image.asset(urlImage, height: 100, width: 100),
                ],
              ),
              Text(
                nomeDoSistema,
                style: const TextStyle(fontWeight: FontWeight.bold, ),
                textScaleFactor: 0.90,
              ),
            ],
          ),
        ),
      ),
    );
  }


}