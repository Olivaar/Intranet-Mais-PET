import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/card_view_aniversariante.dart';
import '../../model/entities/aniversariante.dart';

class ContainerAniversariantes extends StatelessWidget {
  ContainerAniversariantes({super.key});

  final Stream<QuerySnapshot> _aniversariantesStream =
      FirebaseFirestore.instance.collection('aniversariantes')
      .orderBy('dataAniversario').snapshots();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: branco.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text(
              'Aniversariantes +PET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),

            StreamBuilder<QuerySnapshot>(
              stream: _aniversariantesStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasError){
                  return const Text('Erro ao recuperar publicações');
                }

                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }

                return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document){
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    Aniversariante aniversariante = Aniversariante.fromJson(data);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardViewAniversariante(aniversariante: aniversariante)
                    );
                  }).toList().cast(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
