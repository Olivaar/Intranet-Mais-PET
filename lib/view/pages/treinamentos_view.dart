import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/view/widgets/appbar_intranet.dart';
import 'package:intranet_maispet/view/widgets/card_treinamento.dart';
import 'package:intranet_maispet/view/widgets/row_logo_maispet_nome_da_view.dart';

class TreinamentosView extends StatefulWidget {
  const TreinamentosView({super.key});

  @override
  State<TreinamentosView> createState() => _TreinamentosViewState();

}

class _TreinamentosViewState extends State<TreinamentosView> {

  final Stream<QuerySnapshot> _treinamentosStream =
  FirebaseFirestore.instance.collection('treinamentos').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_teste.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const RowLogoMaisPetNomeView(nomeDaView: 'TREINAMENTOS',),

                SizedBox(
                  width: 1200,
                  child: StreamBuilder<QuerySnapshot>(
                    stream:  _treinamentosStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return const Text('Erro ao recuperar treinamentos!');
                      }

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const CircularProgressIndicator();
                      }

                      return Wrap(
                        runSpacing: 10,
                        spacing:  10,
                        alignment: WrapAlignment.center,
                        children: snapshot.data!.docs.map((DocumentSnapshot document){
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          Treinamento treinamento = Treinamento.fromJson(data);
                          return CardTreinamento(treinamento: treinamento);
                        }).toList().cast(),
                      );
                    },
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}