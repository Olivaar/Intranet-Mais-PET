import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/row_ramal_view.dart';
import '../../model/entities/ramal.dart';

class ContainerRamais extends StatelessWidget {

  final String? unidade;
  final List<Ramal> ramais;

  const ContainerRamais({
    super.key,
    required this.unidade,
    required this.ramais,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 0,
        maxHeight: 400,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7),
      width: 320,
      decoration:  const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            unidade!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              for(Ramal ramal in ramais)
                Column(
                  children: [
                    RowRamalView(ramal: ramal),
                    const SizedBox(height: 2,)
                  ],
                )
            ],
          ),
        ]
      ),
    );
  }
}
