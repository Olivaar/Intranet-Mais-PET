import 'package:flutter/material.dart';


class RowLogoMaisPet_NomeView extends StatelessWidget{

  final String nomeDaView;

  const RowLogoMaisPet_NomeView({
    super.key,
    required this.nomeDaView,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Image.asset('images/Logo_Nova-removebg-preview.png',
          height: 110, width: 110,),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          color: const Color(0xffffffff),
          margin: const EdgeInsets.all(5.0),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                Text(nomeDaView, style: const TextStyle(
                  fontWeight: FontWeight.bold),
                  textScaleFactor: 2),
                ],
            ),
          ),
        )
      ],
    );
  }
  
}