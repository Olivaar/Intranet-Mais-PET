import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/model/enums/sistema_page.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/view/colors.dart';
import '../../model/entities/sistema.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();
  AniversarianteController aniversarianteController = AniversarianteController();
  List<String> nomes = [];

  @override
  void initState() {
    super.initState();
    _carregarAniversariantesDoDia();
  }

  Future<void> _carregarAniversariantesDoDia() async{
    final aniversariantesDoDia = await aniversarianteRepository.getAniversariantesDoDia();
    setState(() {
      aniversarianteController.aniversariantesDoDia = aniversariantesDoDia;
      for(Aniversariante an in aniversarianteController.aniversariantesDoDia){
        nomes.add(an.nomeSobrenome);
      }
    });
  }

  final Stream<QuerySnapshot> _sistemasStream =
      FirebaseFirestore.instance.collection('sistemas').snapshots();

  @override
  Widget build(BuildContext context) {

    String versao = '3.4.1';

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
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for(int i=0; i<nomes.length; i++)
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: branco,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.cake, color: Color(0xffFFD400),),
                            const SizedBox(width: 5,),
                            Text(
                              nomes[i],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Image.asset('images/Logo_Nova-removebg-preview.png',
                  height: 140, width: 140,
                ),
                SizedBox(
                  width: 900,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _sistemasStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return const Text('Erro ao recuperar sistemas!');
                      }

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const CircularProgressIndicator();
                      }

                      return Wrap(
                        runSpacing: 4,
                        spacing: 4,
                        alignment: WrapAlignment.center,
                        children: snapshot.data!.docs.map((DocumentSnapshot document){
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          Sistema sistema = Sistema.fromJson(data);
                          if(sistema.sistemaPage == SistemaPage.home){
                            return CardAbrirSistemas(
                              urlDoSistema: sistema.link,
                              urlImage: sistema.urlImage,
                              nomeDoSistema: sistema.nome,
                              sistemaBackground: sistema.sistemaBackground,
                              sistemaPage: sistema.sistemaPage,
                            );
                          }else{
                            return Container();
                          }
                        }).toList().cast(),
                      );
                    },
                  )
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xffFFD400),
        label: Text(versao),
        icon: const Icon(Icons.verified_user_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}