import 'package:flutter/material.dart';

class CardAniversarianteDoDia extends StatelessWidget {

  late String nome;
  late String cargo;
  late String unidade;


  CardAniversarianteDoDia({
    super.key,
    required this.nome,
    required this.cargo,
    required this.unidade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220,
      margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Cor da sombra
              blurRadius: 5.0, // Raio do desfoque da sombra
              offset: const Offset(0, 6), // Deslocamento da sombra (horizontal, vertical)
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.cake, color: Color(0xffFFD400), size: 30,),
                Text(
                  nome,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    cargo,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  unidade,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ],
            ),
          ],
        )
    );
  }
}
