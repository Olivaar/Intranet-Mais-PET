import 'package:flutter/material.dart';

class RowLogoMaisPetNomeView extends StatelessWidget{

  final String nomeDaView;

  const RowLogoMaisPetNomeView({
    super.key,
    required this.nomeDaView,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Image.asset('images/Logo_Nova-removebg-preview.png',
          height: 100, width: 100,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: const Color(0xffffffff),
          margin: const EdgeInsets.only(right: 10),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              nomeDaView,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 2
            ),
          ),
        )
      ],
    );
  }
  
}