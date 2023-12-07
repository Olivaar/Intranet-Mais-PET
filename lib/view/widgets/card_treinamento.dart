import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/view/widgets/buttonImpressaoPdf.dart';
import 'package:intranet_maispet/view/widgets/button_assistir_treinamento.dart';

class CardTreinamento extends StatelessWidget{

  Treinamento treinamento;

  CardTreinamento({
    super.key,
    required this.treinamento,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
        color: const Color(0xffffffff).withOpacity(0.90),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.network(
                treinamento.urlImage!,
                height: 100,
                width: 175,
              ),
              Text(
                treinamento.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 2,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: SingleChildScrollView(
                  child: Text(
                    treinamento.descricao,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              for(String link in treinamento.linksVideos)
                ButtonAssistirTreinamentos(link: link,),
              const SizedBox(height: 15),
              // if(treinamento.urlPdf != null)
              //   ButtonImpressaoPdf(
              //     caminhoDoPdf: treinamento.urlPdf!,
              //     nomeDoTreinamento: treinamento.titulo,
              //   ),
            ],
          ),
        )
    );
  }

}