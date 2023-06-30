import 'package:flutter/material.dart';

class CardTabelaDeRamais extends StatelessWidget{

  final List<Map<String, dynamic>> listaDeRamais; // Lista de dados
  final List<DataColumn> listaDeColunas; // Lista de colunas
  final String nomeDaUnidade;


  const CardTabelaDeRamais({
    super.key,
    required this.listaDeRamais,
    required this.listaDeColunas,
    required this.nomeDaUnidade
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0)
      ),
      color: const Color(0xffffffff),
      margin: const EdgeInsets.fromLTRB(250, 50, 250, 50),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(nomeDaUnidade,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            DataTable(
              columns: listaDeColunas,
              rows: listaDeRamais.map((item) {
                return DataRow(cells: [
                  for (var key in item.keys) DataCell(Text(item[key].toString())),
                ]);
              }).toList(),
            ),
          ],
        )
      )
    );
  }

}