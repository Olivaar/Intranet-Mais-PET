import 'package:flutter/material.dart';

import 'appBarButton.dart';
import 'appBarSocialMediaIcon.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget{

  const appBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffFFD200),
      elevation: 0,

      title: Row(
        children: [
          appBarButton(text: "HOME", onPressed: (){}),
          appBarButton(text: "RAMAIS", onPressed: (){}),
          appBarButton(text: "DOCUMENTOS", onPressed: (){}),
          appBarButton(text: "TREINAMENTOS", onPressed: (){}),
          appBarButton(text: "CHAMADOS", onPressed: (){}),
        ],
      ),
      actions: const [
        appBarSocialMediaIcon(
            url: 'https://maispetoficial.com.br',
            icon: Icons.pets),
        appBarSocialMediaIcon(
            url: 'https://instagram.com/maispetoficial?igshid=MmJiY2I4NDBkZg==',
            icon: Icons.alternate_email),
        appBarSocialMediaIcon(
            url: 'https://www.facebook.com/maispetoficial',
            icon: Icons.facebook)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}