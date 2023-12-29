import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonImpressaoPdf extends StatelessWidget {
  final String caminhoDoPdf;

  const ButtonImpressaoPdf({
    super.key,
    required this.caminhoDoPdf,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () async{
            if(await canLaunchUrl(Uri.parse(caminhoDoPdf))){
              await launchUrl(Uri.parse(caminhoDoPdf));
            } else {
              throw 'Não foi possível abrir o vídeo, contate a equipe de T.I!';
            }
          },
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('BAIXAR PDF'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFD200)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                fontWeight: FontWeight.bold
            ))
          ),
        )
      ],
    );
  }
}
