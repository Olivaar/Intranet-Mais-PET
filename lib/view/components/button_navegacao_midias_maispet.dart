import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonNavegacaoMidiasMaispet extends StatelessWidget{

  final String urlDaMidia;
  final IconData iconeDaMidia;

  const ButtonNavegacaoMidiasMaispet({
    super.key,
    required this.urlDaMidia,
    required this.iconeDaMidia
});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if(await canLaunchUrl(Uri.parse(urlDaMidia))){
            await launchUrl(Uri.parse(urlDaMidia));
          }else{
            throw 'Não foi possível abrir esse site $urlDaMidia';
          }
        },
        icon: Icon(iconeDaMidia),
    );
  }

}
