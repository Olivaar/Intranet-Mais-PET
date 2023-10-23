import 'package:flutter/material.dart';
import 'button_navegacao_paginas_intranet.dart';
import 'button_navegacao_midias_maispet.dart';

class AppBarIntranet extends StatelessWidget implements PreferredSizeWidget{

  Color appBarColor;
  Color buttonColor;


  AppBarIntranet({
    super.key,
    this.appBarColor = const Color(0xffFFD400),
    this.buttonColor = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          ButtonNavegacaoPaginasIntranet(
            color: buttonColor,
            nomeDaPagina: "HOME",
            iconeDaPagina: Icons.home,
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            }
          ),
          const SizedBox(width: 5,),
          ButtonNavegacaoPaginasIntranet(
            color: buttonColor,
            nomeDaPagina: "RAMAIS",
            iconeDaPagina: Icons.phone,
            onPressed: (){
              Navigator.pushNamed(context, '/ramais');
            }
          ),
          const SizedBox(width: 5,),
          ButtonNavegacaoPaginasIntranet(
            color: buttonColor,
            nomeDaPagina: "TREINAMENTOS",
            iconeDaPagina: Icons.playlist_play_sharp,
            onPressed: (){
              Navigator.pushNamed(context, '/treinamentos');
            }
          ),
          const SizedBox(width: 5,),
          ButtonNavegacaoPaginasIntranet(
            color: buttonColor,
            nomeDaPagina: "ANIVERSARIANTES",
            iconeDaPagina: Icons.cake_outlined,
            onPressed: (){
              Navigator.pushNamed(context, '/aniversariantes');
            }
          ),
          const SizedBox(width: 5,),
          ButtonNavegacaoPaginasIntranet(
            color: buttonColor,
            nomeDaPagina: "DEPARTAMENTOS",
            iconeDaPagina: Icons.block_outlined,
            onPressed: (){},
          ),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}