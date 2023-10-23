import 'package:flutter/material.dart';

import '../widgets/appBar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';


class TecnologiaView extends StatefulWidget{

  @override
  _TecnologiaViewState createState() => _TecnologiaViewState();
}

class _TecnologiaViewState  extends State<TecnologiaView>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBarIntranet(
          appBarColor: const Color(0xff34B9D6),
          buttonColor: Colors.lightBlue.shade700,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back_ti.png'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: const Color(0xff34B9D6),
                          margin: const EdgeInsets.all(5.0),
                          child: const Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget> [
                                Text(
                                  'TECNOLOGIA +PET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                  textScaleFactor: 2,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox.fromSize(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CardAbrirSistemas(
                          urlDoSistema: 'https://app.onepet.com.br/index.php',
                          caminhoDoIconeDoSistema: 'images/logo_onepet.png',
                          nomeDoSistema: 'ONEPET',
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
                          urlDoSistema: 'https://maispetoficial.intelite.com.br/admincarteirinha',
                          caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                          nomeDoSistema: 'CARTEIRINHAS',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://www.microsoft.com/pt-br/microsoft-teams/log-in',
                          caminhoDoIconeDoSistema: 'images/logo_teams.png',
                          nomeDoSistema: 'TEAMS',
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
                          corDeFundo: const Color(0xffFFD400),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://maispetoficial.intelite.com.br/panel/entrar',
                          caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                          nomeDoSistema: 'INTELITE',
                          corDeFundo: const Color(0xffFFD400),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://maispetplanosveterinarios.s4e.com.br/SYS/',
                          caminhoDoIconeDoSistema: 'images/logo_s4e.jpg',
                          nomeDoSistema: 'S4E',
                          corDeFundo: const Color(0xffFFD400),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://webmail.telemedmaispetoficial.com.br/',
                          caminhoDoIconeDoSistema: 'images/webmail_logo.png',
                          nomeDoSistema: 'WEBMAIL TELE',
                          corDeFundo: const Color(0xff34B9D6),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://telemed.intelite.com.br/panel',
                          caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                          nomeDoSistema: 'INTELITE TELE',
                          corDeFundo: const Color(0xff34B9D6),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://telemed.s4e.com.br/SYS/',
                          caminhoDoIconeDoSistema: 'images/logo_s4e.jpg',
                          nomeDoSistema: 'S4E TELEMED',
                          corDeFundo: const Color(0xff34B9D6),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
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
                          urlDoSistema: 'https://app.buzzlead.com.br/painel/auth#/',
                          caminhoDoIconeDoSistema: 'images/logo_buzzLead.png',
                          nomeDoSistema: 'BUZZLEAD',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://financas.f360.com.br/?redirect=%2fUsuario',
                          caminhoDoIconeDoSistema: 'images/logo_F360.JPG',
                          nomeDoSistema: 'F360',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://televets.com.br/soulvet',
                          caminhoDoIconeDoSistema: 'images/logo_televets.png',
                          nomeDoSistema: 'TELEVETS',
                          corDeFundo: const Color(0xff34B9D6),
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'http://intelite.com.br/ai-relatorio',
                          caminhoDoIconeDoSistema: 'images/logo_senhas.png',
                          nomeDoSistema: 'RELATÓRIOS AI',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CardAbrirSistemas(
                          urlDoSistema: 'https://trello.com/w/tix294/home',
                          caminhoDoIconeDoSistema: 'images/logo_trello.png',
                          nomeDoSistema: 'TRELLO',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'http://soulpet.primetek.com.br/?orgId=5',
                          caminhoDoIconeDoSistema: 'images/logo_grafana.png',
                          nomeDoSistema: 'GRAFANA',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://s4e.movidesk.com/',
                          caminhoDoIconeDoSistema: 'images/logo_moviedesk.jpg',
                          nomeDoSistema: 'MOVIEDESK S4E',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://www.pivotaltracker.com/n/projects/2623478',
                          caminhoDoIconeDoSistema: 'images/logo_pivotal.png',
                          nomeDoSistema: 'PIVOTAL',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://ucpro.algartelecom.com.br/',
                          caminhoDoIconeDoSistema: 'images/logo_algar.png',
                          nomeDoSistema: 'PABX',
                        ),
                        CardAbrirSistemas(
                          urlDoSistema: 'https://tcloud.totvs.com.br/login',
                          caminhoDoIconeDoSistema: 'images/logo_totvs.png',
                          nomeDoSistema: 'T-CLOUD',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CardAbrirSistemas(
                          urlDoSistema: 'https://algartelecom.com.br/AreaClienteCorporativo/login',
                          caminhoDoIconeDoSistema: 'images/logo_algar.png',
                          nomeDoSistema: 'CONTAS ALGAR',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}