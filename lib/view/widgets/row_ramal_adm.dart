import 'package:flutter/material.dart';
import '../../controller/ramal_controller.dart';
import '../../model/entities/ramal.dart';
import '../../repositories/ramal_repository.dart';

class RowRamalAdm extends StatefulWidget {
  final Ramal ramal;
  final String? unidadeSelecionada;
  final Function carregarRamais;

  const RowRamalAdm({
    super.key,
    required this.ramal,
    required this.unidadeSelecionada,
    required this.carregarRamais,
  });

  @override
  State<RowRamalAdm> createState() => _RowRamalAdmState();
}

class _RowRamalAdmState extends State<RowRamalAdm> {

  RamalController ramalController = RamalController();
  RamalRepository ramalRepository = RamalRepository();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            widget.ramal.local,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),

        SizedBox(
          width: 150,
          child: Text(
            widget.ramal.numero,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ]
    );
  }
}
