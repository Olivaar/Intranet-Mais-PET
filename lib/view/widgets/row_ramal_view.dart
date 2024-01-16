import 'package:flutter/material.dart';
import '../../model/entities/ramal.dart';

class RowRamalView extends StatelessWidget {

  final Ramal ramal;

  const RowRamalView({
    super.key,
    required this.ramal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xffFFD200),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            )
          ),
          width: 200,
          height: 50,
          child: Text(
            ramal.local,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          width: 100,
          height: 50,
          child: Text(
            ramal.numero,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
