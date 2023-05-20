import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class redirectSystemButton extends StatelessWidget{

  final String url;
  final String referencePathImage;
  final String text;

  const redirectSystemButton ({
    super.key,
    required this.url,
    required this.referencePathImage,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffffffff),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          if(await canLaunchUrl(Uri.parse(url))){
            await launchUrl(Uri.parse(url));
          }else{
            throw 'Não foi possível abrir o site $url';
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Row(
                children: <Widget> [
                  Image.asset(referencePathImage, height: 100, width: 100),
                ],
              ),
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold, ),
                textScaleFactor: 1,)
            ],
          ),
        ),
      ),
    );
  }


}