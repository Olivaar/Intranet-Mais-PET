import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/model/enums/sistema_background.dart';
import 'package:intranet_maispet/model/enums/sistema_page.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
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

  @override
  Widget build(BuildContext context) {

    String versao = '3.0.0';
    AniversarianteController aniversarianteController = AniversarianteController();
    RamalRepository ramalRepository = RamalRepository();

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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.cake, color: Color(0xffFFD400),),
                            const SizedBox(width: 5,),
                            Text(
                              nomes[i],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Image.asset('images/Logo_Nova-removebg-preview.png',
                  height: 140, width: 140,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    CardAbrirSistemas(
                      urlDoSistema: 'https://app.onepet.com.br/index.php',
                      urlImage: 'images/logo_onepet.png',
                      nomeDoSistema: 'ONEPET',
                      sistemaBackground: SistemaBackground.telemed,
                      sistemaPage: SistemaPage.home,
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://app.onepet.com.br/index.php',
                      urlImage: 'images/logo_onepet.png',
                      nomeDoSistema: 'ONEPET',
                      sistemaBackground: SistemaBackground.maispet,
                      sistemaPage: SistemaPage.home,
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://app.onepet.com.br/index.php',
                      urlImage: 'images/logo_onepet.png',
                      nomeDoSistema: 'ONEPET',
                      sistemaBackground: SistemaBackground.normal,
                      sistemaPage: SistemaPage.home,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext contex){
          //     return AlertDialog(
          //       backgroundColor: const Color(0xffFFD400),
          //       title: Text(
          //         'NOTAS DE ATUALIZAÇÃO $versao',
          //         style: const TextStyle(
          //           fontWeight: FontWeight.bold, color: Colors.white,
          //         ),
          //         textScaleFactor: 1,
          //         textAlign: TextAlign.center,
          //       ),
          //       content: const SizedBox(
          //         // width: 375,
          //         child: Padding(
          //           padding: EdgeInsets.all(16),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Text(
          //                     '- ANIVERSARIANTES...\n'
          //                     'Ja está disponível a aba de aniversariantes,\n'
          //                     'fiquem atentos que em breve os aniversarientes do mês\n'
          //                     'aparecerão por aqui!',
          //                     maxLines: 5,
          //                     softWrap: true,
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () async {
          //             Navigator.of(context).pop();
          //             Ramal ramal = Ramal(
          //               unidade: 'Holding',
          //               local: 'Tecnologia',
          //               numero: '7250',
          //             );
          //             ramalRepository.createRamal(ramal);
          //           },
          //           style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
          //             foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //             textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          //               fontWeight: FontWeight.bold,
          //             )),
          //           ),
          //           child: const Text('Fechar'),
          //         ),
          //       ],
          //     );
          //   }
          // );
        },
        backgroundColor: const Color(0xffFFD400),
        label: Text(versao),
        icon: const Icon(Icons.verified_user_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}