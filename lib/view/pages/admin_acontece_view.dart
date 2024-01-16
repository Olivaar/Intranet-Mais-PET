import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appbar_intranet.dart';
import 'package:intranet_maispet/view/widgets/card_edit_publicacao.dart';
import 'package:intranet_maispet/view/widgets/container_nova_publicacao.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/row_logo_maispet_nome_da_view.dart';

class AdminAcontece extends StatefulWidget {
  const AdminAcontece({super.key});

  @override
  State<AdminAcontece> createState() => _AdminAconteceState();
}

class _AdminAconteceState extends State<AdminAcontece> {
  final Stream<QuerySnapshot> _publicacoesStream =
    FirebaseFirestore.instance.collection('publicacoes')
      .orderBy('dataPublicacao', descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(
        appBarColor: azulClaro,
        buttonColor: azulEscuro,
        leading: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_teste.png'),
                fit: BoxFit.cover,
              )
            ),
          ),

          Column(
            children: [
              const RowLogoMaisPetNomeView(nomeDaView: 'ADM +PET'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.8
                      ),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _publicacoesStream,
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
                                Publicacao publicacao = Publicacao.fromJson(data);
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CardEditPulicacao(
                                    publicacao: publicacao,
                                    adm: true,
                                  ),
                                );
                              }).toList().cast(),
                            );
                          },
                        )
                      ),
                    )
                  ),

                  Expanded(
                    flex: 1,
                    child: ContainerNovaPublicacao(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}
