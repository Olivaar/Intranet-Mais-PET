import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/view/widgets/appbar_intranet.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/row_add_aniversariante.dart';
import 'package:intranet_maispet/view/widgets/row_adm_aniversariantes.dart';
import 'package:intranet_maispet/view/widgets/row_logo_maispet_nome_da_view.dart';
import '../colors.dart';
import '../widgets/theme_helper.dart';

class AdminAniversariantesView extends StatefulWidget {
  const AdminAniversariantesView({super.key});

  @override
  State<AdminAniversariantesView> createState() => _AdminAniversariantesViewState();
}

class _AdminAniversariantesViewState extends State<AdminAniversariantesView> {

  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  final Stream<QuerySnapshot> _aniversariantesStream =
    FirebaseFirestore.instance.collection('aniversariantes')
    .orderBy('dataAniversario').snapshots();


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
              ),
            ),
          ),

          Column(
            children: [
              const RowLogoMaisPetNomeView(nomeDaView: 'ADM Aniversariantes'),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 350,
                ),
                child: Container(
                  width: 900,
                  margin: const EdgeInsets.only(left: 175, right: 175),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: azulClaro,
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _aniversariantesStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return const Text('Erro ao recuperar sistemas');
                      }

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const CircularProgressIndicator();
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document){
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          Aniversariante aniversariante = Aniversariante.fromJson(data);
                          return RowAdmAniversariantes(aniversariante: aniversariante,);
                        }).toList().cast(),
                      );
                    },
                  )
                ),
              ),
              const SizedBox(height: 10,),

              const RowAddAniversariante(),
              const SizedBox(height: 10,),

              TextButton.icon(
                style: ThemeHelper().buttonStyle2(),
                onPressed: () async{
                  aniversarianteRepository.deleteAllAniversariantes();
                },
                icon: const Icon(Icons.delete),
                label: const Text('LIMPAR LISTA'),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}


