import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
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

    String versao = '2.5.5';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Image.asset('images/Logo_Nova-removebg-preview.png',
                      height: 140, width: 140,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    CardAbrirSistemas(
                      urlDoSistema: 'https://app.onepet.com.br/index.php',
                      caminhoDoIconeDoSistema: 'images/logo_onepet.png',
                      nomeDoSistema: 'ONEPET',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://maispetplanosveterinarios.s4e.com.br/SYS/',
                      caminhoDoIconeDoSistema: 'images/logo_s4e.jpg',
                      nomeDoSistema: 'S4E',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://s15.chatguru.app/login?uri=%2Fdashboard%3F',
                      caminhoDoIconeDoSistema: 'images/logo_chat.jpg',
                      nomeDoSistema: 'CHATGURU',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://ucpro.algartelecom.com.br/cloudphonepro/#/',
                      caminhoDoIconeDoSistema: 'images/logo_algar.png',
                      nomeDoSistema: 'SQUAD',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'http://intelite.com.br/panel-dev/',
                      caminhoDoIconeDoSistema: 'images/logo_senhas.png',
                      nomeDoSistema: 'SENHAS',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://api.whatsapp.com/send/?phone=5562998414811&text&type=phone_number&app_absent=0',
                      caminhoDoIconeDoSistema: 'images/logo_guru.png',
                      nomeDoSistema: 'TI',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://maispetoficial.intelite.com.br/admincarteirinha',
                      caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                      nomeDoSistema: 'CARTEIRINHAS',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    CardAbrirSistemas(
                      urlDoSistema: 'https://webmail.maispetoficial.com.br/cpsess8522391036/3rdparty/roundcube/?_task=mail&_mbox=INBOX',
                      caminhoDoIconeDoSistema: 'images/webmail_logo.png',
                      nomeDoSistema: 'WEBMAIL',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://portal.p4x.srv.br/login',
                      caminhoDoIconeDoSistema: 'images/logo_p4x.png',
                      nomeDoSistema: 'P4X',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://admin.elosgate.com.br/login',
                      caminhoDoIconeDoSistema: 'images/logo_elosgate.png',
                      nomeDoSistema: 'ELOSGATE',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://www.microsoft.com/pt-br/microsoft-teams/log-in',
                      caminhoDoIconeDoSistema: 'images/logo_teams.png',
                      nomeDoSistema: 'TEAMS',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://maispetoficial.intelite.com.br/panel/entrar',
                      caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                      nomeDoSistema: 'INTELITE',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://app.buzzlead.com.br/painel/auth#/',
                      caminhoDoIconeDoSistema: 'images/logo_buzzLead.png',
                      nomeDoSistema: 'BUZZLEAD',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://financas.f360.com.br/?redirect=%2fUsuario',
                      caminhoDoIconeDoSistema: 'images/logo_F360.JPG',
                      nomeDoSistema: 'F360',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    CardAbrirSistemas(
                      urlDoSistema: 'https://www.santandernetibe.com.br/',
                      caminhoDoIconeDoSistema: 'images/logo_santander.png',
                      nomeDoSistema: 'SANTANDER',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://solucoes.receita.fazenda.gov.br/Servicos/cnpjreva/cnpjreva_solicitacao.asp',
                      caminhoDoIconeDoSistema: 'images/logo_consulta_cnpj.png',
                      nomeDoSistema: 'CONSULTA CNPJ',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://www.ne12.bradesconetempresa.b.br/ibpjlogin/login.jsf',
                      caminhoDoIconeDoSistema: 'images/logo_bradesco.png',
                      nomeDoSistema: 'BRADESCO',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://minhaconta.getnet.com.br/login',
                      caminhoDoIconeDoSistema: 'images/logo_getnet.png',
                      nomeDoSistema: 'GETNET',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://algartelecom.com.br/AreaClienteCorporativo/login',
                      caminhoDoIconeDoSistema: 'images/logo_algar.png',
                      nomeDoSistema: 'CONTAS ALGAR',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://www.saneago.com.br/agencia-virtual/#/2a_via',
                      caminhoDoIconeDoSistema: 'images/logo_seneago.png',
                      nomeDoSistema: 'SENEAGO',
                    ),
                    CardAbrirSistemas(
                      urlDoSistema: 'https://sincronizador.gefis.com.br/login',
                      caminhoDoIconeDoSistema: 'images/logo_gefis.jpg',
                      nomeDoSistema: 'GEFIS',
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