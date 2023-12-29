import 'package:flutter/material.dart';

class PdfController{

  void mostrarPopup(BuildContext context,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ERRO!'),
          content: const Text('Selecione uma Unidade!'),
          actions: [
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}