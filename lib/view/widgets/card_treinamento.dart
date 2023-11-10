import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/buttonImpressaoPdf.dart';
import 'package:intranet_maispet/view/widgets/button_assistir_treinamento.dart';

class CardTreinamento extends StatelessWidget{

  final String nomeDoTreinamento;
  final String resumoDoTreinamento;
  final List<String> links;
  String? caminhoDoPdf;
  String nomeDoPdf;
  String caminhoDaImagem;


  CardTreinamento({
    super.key,
    required this.nomeDoTreinamento,
    required this.resumoDoTreinamento,
    required this.links,
    this.caminhoDoPdf,
    this.nomeDoPdf = '',
    this.caminhoDaImagem = 'assets/images/Logo_Nova-removebg-preview.png',
  });

  @override
  Widget build(BuildContext context) {

    return Card(
        color: const Color(0xffffffff).withOpacity(0.90),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.asset(
                caminhoDaImagem,
                height: 100,
                width: 175,
              ),
              Text(
                nomeDoTreinamento,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 2,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: SingleChildScrollView(
                  child: Text(
                    resumoDoTreinamento,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              for(String link in links)
                ButtonAssistirTreinamentos(link: link,),
              const SizedBox(height: 15),
              if(caminhoDoPdf != null)
                ButtonImpressaoPdf(
                  caminhoDoPdf: caminhoDoPdf!,
                  nomeDoTreinamento: nomeDoTreinamento,
                ),
            ],
          ),
        )
    );
  }

}