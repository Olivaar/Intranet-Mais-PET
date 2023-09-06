import 'package:flutter/material.dart';

import '../../control/guiController/pdf_controller.dart';

class ButtonImpressaoPdf extends StatelessWidget {
  final String caminhoDoPdf;
  final String nomeDoTreinamento;

  const ButtonImpressaoPdf({
    super.key,
    required this.caminhoDoPdf,
    required this.nomeDoTreinamento
  });

  @override
  Widget build(BuildContext context) {
    PdfController impressaoPdfController = PdfController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () async{
            impressaoPdfController.baixarPdf(
              caminhoDoPdf,
              nomeDoTreinamento
            );
          },
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('BAIXAR PDF'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFD200)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                fontWeight: FontWeight.bold
            ))
          ),
        )
      ],
    );
  }
}
