import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/controller/publicacao_controller.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/alert_aniversariante_do_dia_background.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/card_edit_publicacao.dart';
import 'package:intranet_maispet/view/widgets/container_aniversariantes.dart';

class AconteceNaPet extends StatefulWidget {
  const AconteceNaPet({super.key});

  @override
  State<AconteceNaPet> createState() => _AconteceNaPetState();
}

class _AconteceNaPetState extends State<AconteceNaPet> {

  AniversarianteController aniversarianteController = AniversarianteController();
  PublicacaoController publicacaoController = PublicacaoController();

  final Stream<QuerySnapshot> _publicacoesStream =
  FirebaseFirestore.instance.collection('publicacoes')
      .orderBy('dataPublicacao', descending: true).snapshots();

  @override
  void initState() {
    super.initState();
    aniversarianteController.carregarAniversariantes();
    aniversarianteController.carregarAniversariantesDoDia();

    Future.delayed(const Duration(milliseconds: 3500)).then((_) {
      if(aniversarianteController.aniversariantesDoDia.isNotEmpty){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return const AlertAniversarianteDoDiaBackground();
          }
        );
      }
    });
  }

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
              )
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height -10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: branco.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/maispet-testes.appspot.com/o/treinamentos%2Fimages%2FLogo_Nova-removebg-preview.png?alt=media&token=32a9dceb-148f-4705-9cb7-85670a35cb05',
                        height: 60, width: 60,
                      ),

                      const Text(
                        'Acontece na +PET',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
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
                                      adm: false,
                                    ),
                                  );
                                }).toList().cast(),
                              );
                            },
                          ),
                        )
                      ),

                      Expanded(
                        flex: 1,
                        child: ContainerAniversariantes()
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
