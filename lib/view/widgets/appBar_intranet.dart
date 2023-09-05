import 'package:flutter/material.dart';
import 'package:intranet_maispet/control/guiController/treinamento_view_controller.dart';

import 'button_navegacao_paginas_intranet.dart';
import 'button_navegacao_midias_maispet.dart';

class AppBarIntranet extends StatelessWidget implements PreferredSizeWidget{

  TreinamentosViewController treinamentosController = TreinamentosViewController();
  Color color;

  AppBarIntranet({
    super.key,
    this.color = const Color(0xffFFD400)
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,

      title: Row(
        children: [
          ButtonNavegacaoPaginasIntranet(
            nomeDaPagina: "HOME",
            iconeDaPagina: Icons.home,
            onPressed: (){
              Navigator.pushNamed(context, '/home');
          }),
          ButtonNavegacaoPaginasIntranet(
            nomeDaPagina: "RAMAIS",
            iconeDaPagina: Icons.phone,
            onPressed: (){
              Navigator.pushNamed(context, '/ramais');
          }),
          ButtonNavegacaoPaginasIntranet(
              nomeDaPagina: "TREINAMENTOS",
              iconeDaPagina: Icons.playlist_play_sharp,
              onPressed: (){
                Navigator.pushNamed(context, '/treinamentos');
              }),
          ButtonNavegacaoPaginasIntranet(
              nomeDaPagina: "DOCUMENTOS",
              onPressed: (){},
              iconeDaPagina: Icons.block_outlined),
        ],
      ),
      actions: const [
        ButtonNavegacaoMidiasMaispet(
            urlDaMidia: 'https://maispetoficial.com.br',
            iconeDaMidia: Icons.pets),
        ButtonNavegacaoMidiasMaispet(
            urlDaMidia: 'https://instagram.com/maispetoficial?igshid=MmJiY2I4NDBkZg==',
            iconeDaMidia: Icons.alternate_email),
        ButtonNavegacaoMidiasMaispet(
            urlDaMidia: 'https://www.facebook.com/maispetoficial',
            iconeDaMidia: Icons.facebook)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}