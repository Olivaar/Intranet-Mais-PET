import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appBar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({super.key, required this.title});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {String? _string;


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
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}
}