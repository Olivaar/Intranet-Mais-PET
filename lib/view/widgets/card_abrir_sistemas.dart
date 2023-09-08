import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardAbrirSistemas extends StatelessWidget{

  final String urlDoSistema;
  final String caminhoDoIconeDoSistema;
  final String nomeDoSistema;
  Color corDeFundo;

  CardAbrirSistemas ({
    super.key,
    required this.urlDoSistema,
    required this.caminhoDoIconeDoSistema,
    required this.nomeDoSistema,
    this.corDeFundo = const Color(0xffFFFFFF)
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: corDeFundo,
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
                  Image.asset(caminhoDoIconeDoSistema, height: 100, width: 100),
                ],
              ),
              Text(nomeDoSistema, style: const TextStyle(fontWeight: FontWeight.bold, ),
                textScaleFactor: 0.90,)
            ],
          ),
        ),
      ),
    );
  }


}