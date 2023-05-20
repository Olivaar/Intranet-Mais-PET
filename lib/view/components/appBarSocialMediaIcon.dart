import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class appBarSocialMediaIcon extends StatelessWidget{

  final String url;
  final IconData icon;

  const appBarSocialMediaIcon({
    super.key,
    required this.url,
    required this.icon
});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if(await canLaunchUrl(Uri.parse(url))){
            await launchUrl(Uri.parse(url));
          }else{
            throw 'Não foi possível abrir esse site $url';
          }
        },
        icon: Icon(icon),
    );
  }

}
