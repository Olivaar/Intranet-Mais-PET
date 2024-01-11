import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/card_abrir_sistemas.dart';
import 'package:intranet_maispet/view/widgets/container_novo_sistema.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';
import '../../model/entities/sistema.dart';


class AdminSistemas extends StatefulWidget {
  const AdminSistemas({super.key});

  @override
  State<AdminSistemas> createState() => _AdminSistemasState();
}

class _AdminSistemasState extends State<AdminSistemas> {

  final Stream<QuerySnapshot> _sistemasStream =
    FirebaseFirestore.instance.collection('sistemas').snapshots();

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
          SingleChildScrollView(
            child: Column(
              children: [

                const RowLogoMaisPet_NomeView(nomeDaView: 'ADM Sistemas'),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                        decoration: ThemeHelper().containerDecoration(),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _sistemasStream,
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                            if(snapshot.hasError){
                              return const Text('Erro ao recuperar sistemas');
                            }

                            if(snapshot.connectionState == ConnectionState.waiting){
                              return const CircularProgressIndicator();
                            }

                            return Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              alignment: WrapAlignment.center,
                              children: snapshot.data!.docs.map((DocumentSnapshot document){
                                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                                Sistema sistema = Sistema.fromJson(data);
                                return CardAbrirSistemas(
                                  urlDoSistema: sistema.link,
                                  urlImage: sistema.urlImage,
                                  nomeDoSistema: sistema.nome,
                                  sistemaBackground: sistema.sistemaBackground,
                                  sistemaPage: sistema.sistemaPage,
                                );
                              }).toList().cast(),
                            );
                          },
                        )
                      )
                    ),

                    const Expanded(
                      flex: 1,
                      child: ContainerNovoSistema(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}
