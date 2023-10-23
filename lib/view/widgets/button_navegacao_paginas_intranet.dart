import 'package:flutter/material.dart';

class ButtonNavegacaoPaginasIntranet extends StatelessWidget{
  final String nomeDaPagina;
  final void Function() onPressed;
  final IconData? iconeDaPagina;
  Color color;

  ButtonNavegacaoPaginasIntranet({
    super.key,
    required this.nomeDaPagina,
    required this.onPressed,
    this.iconeDaPagina,
    this.color = const Color(0xffFFD400),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(nomeDaPagina),
      icon: Icon(iconeDaPagina),
      style: ButtonStyle(
        backgroundColor: color != null ? MaterialStateProperty.all<Color>(color) : null,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }

}