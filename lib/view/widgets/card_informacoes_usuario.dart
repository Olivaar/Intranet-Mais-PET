import 'package:flutter/material.dart';

class CardInformacoesUsuario extends StatelessWidget{

  final String? nomeDoUsuario;
  final String nomeDoComputador;

  const CardInformacoesUsuario({
    super.key,
    required this.nomeDoUsuario,
    required this.nomeDoComputador
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0)
      ),
      color: const Color(0xffffffff),
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Text(nomeDoUsuario!,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1),
            Text(nomeDoComputador,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1),
          ],
        ),
      ),
    );
  }

}