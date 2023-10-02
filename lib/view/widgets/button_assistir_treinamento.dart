import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonAssistirTreinamentos extends StatelessWidget {
  const ButtonAssistirTreinamentos({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () async{
            if(await canLaunchUrl(Uri.parse(link))){
              await launchUrl(Uri.parse(link));
            } else {
              throw 'Não foi possível abrir o vídeo, contate a equipe de T.I!';
            }
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('ASSISTIR TREINAMENTO'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFD200)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontWeight: FontWeight.bold
            ))
          ),
        ),
        const SizedBox(height: 40,)
      ],
    );
  }
}
