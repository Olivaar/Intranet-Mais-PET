import 'package:flutter/material.dart';

class appBarButton extends StatelessWidget{
  final String text;
  final void Function() onPressed;

  const appBarButton(
    {super.key, required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }

}