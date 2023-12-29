import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/view/widgets/button_impressao_pdf.dart';
import 'package:intranet_maispet/view/widgets/button_assistir_treinamento.dart';

class CardTreinamento extends StatelessWidget{

  Treinamento treinamento;

  CardTreinamento({
    super.key,
    required this.treinamento,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffffffff).withOpacity(0.90),
      ),
      width: 380,
      height: 290,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.network(
              treinamento.urlImage != null ? treinamento.urlImage! :
              'https://firebasestorage.googleapis.com/v0/b/maispet-testes.appspot.com/o/treinamentos%2Fimages%2FLogo_Nova-removebg-preview.png?alt=media&token=32a9dceb-148f-4705-9cb7-85670a35cb05',
              height: 100,
              width: 175,
            ),
            Text(
              treinamento.titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 350,
                maxHeight: 50
              ),
              child: SingleChildScrollView(
                child: Text(
                  treinamento.descricao,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  for(String link in treinamento.linksVideos)
                    ButtonAssistirTreinamentos(link: link,),
                  const SizedBox(width: 15),
                  if(treinamento.urlPdf != null)
                    ButtonImpressaoPdf(
                      caminhoDoPdf: treinamento.urlPdf!,
                    ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}