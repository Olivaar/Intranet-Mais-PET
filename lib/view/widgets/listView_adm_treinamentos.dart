import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/view/widgets/container_novo_treinamento.dart';
import '../../repositories/treinamento_repository.dart';
import '../colors.dart';

class ListViewAdmTreinamentos extends StatefulWidget {
  const ListViewAdmTreinamentos({super.key});

  @override
  State<ListViewAdmTreinamentos> createState() => _ListViewAdmTreinamentosState();
}

class _ListViewAdmTreinamentosState extends State<ListViewAdmTreinamentos> {

  final TreinamentoRepository treinamentoRepository = TreinamentoRepository();

  final Stream<QuerySnapshot> _treinamentosStream =
  FirebaseFirestore.instance.collection('treinamentos').snapshots();

  Widget buildUpdateDialog(BuildContext context, Treinamento tr ){
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        child: ContainerNovoTreinamento(updateTreinamento: tr,),
      ),
      actions: const < Widget > [] ,
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
              color: branco,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  'LISTA DE TREINAMENTOS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: azulEscuro,
                  ),
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                StreamBuilder<QuerySnapshot>(
                  stream: _treinamentosStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError){
                      return const Text('Erro ao recuperar treinamentos!');
                    }

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }

                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((DocumentSnapshot document){
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Container(
                          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          decoration: BoxDecoration(
                            color: azulEscuro,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 350,
                                child: Text(
                                  data['titulo'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: preto,
                                  ),
                                ),
                              ),
                              IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Treinamento updateTreinamento = Treinamento.fromJson(data);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                      buildUpdateDialog(context, updateTreinamento)
                                  );
                                },
                                icon: const Icon(Icons.edit, color: preto,),
                              ),
                              IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  treinamentoRepository.deleteTreinamento(data['id']);
                                },
                                icon: const Icon(Icons.delete, color: preto,),
                              ),
                            ],
                          ),
                        );
                      }).toList().cast(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
