import 'package:flutter/material.dart';

class ShowDialogErro extends StatelessWidget {

  final String title;
  final String content;
  final String textButton;

  const ShowDialogErro({
    super.key,
    required this.title,
    required this.content,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content:  Text(content),
      actions: [
        TextButton(
          child: Text(textButton),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

