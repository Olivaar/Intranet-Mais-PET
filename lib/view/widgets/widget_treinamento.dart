import 'package:flutter/material.dart';
import 'package:intranet_maispet/control/guiController/pdf_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetTreinamento extends StatelessWidget{

  final String nomeDoTreinamento;
  final String resumoDoTreinamento;
  final String linkDoTreinameto;
  String caminhoDoPdf;
  String nomeDoPdf;
  String caminhoDaImagem;


  WidgetTreinamento({
    super.key,
    required this.nomeDoTreinamento,
    required this.resumoDoTreinamento,
    required this.linkDoTreinameto,
    this.caminhoDoPdf = '',
    this.nomeDoPdf = '',
    required this.caminhoDaImagem
  });

  @override
  Widget build(BuildContext context) {
    PdfController impressaoPdfController = PdfController();
    return Container(
      width: 450,
      // height: 350,
      child: Card(
          color: const Color(0xffffffff).withOpacity(0.90),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      caminhoDaImagem,
                      height: 150,
                      width: 215,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nomeDoTreinamento,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      child: Text(
                        resumoDoTreinamento,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () async{
                        if(await canLaunchUrl(Uri.parse(linkDoTreinameto))){
                          await launchUrl(Uri.parse(linkDoTreinameto));
                        } else {
                          throw 'Não foi possível abrir o vídeo, contate a equipe de T.I!';
                        }
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('ASSISTIR TREINAMENTO'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFD200)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                              fontWeight: FontWeight.bold
                          ))
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () async{
                        impressaoPdfController.baixarPdf(
                            caminhoDoPdf,
                            nomeDoPdf);
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
                )
              ],
            ),
          )
      ),
    );
  }

}