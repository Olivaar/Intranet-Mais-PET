import 'package:flutter/material.dart';
import 'dart:html' as html;

//TODO Refatorar metodo baixarPdf

class PdfController{

  void baixarPdf(String caminhoDoPdf, String nomeDoPdf){
    final filePath = caminhoDoPdf;
    final anchorElement = html.AnchorElement(href: filePath);
    if(caminhoDoPdf != ''){
      anchorElement.download = nomeDoPdf;
      anchorElement.click();
    }

  }

  void mostrarPopup(BuildContext context) {
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