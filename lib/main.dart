import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/components/appBar_intranet.dart';
import 'package:intranet_maispet/view/components/card_abrir_sistemas.dart';
import 'package:intranet_maispet/view/gui/ramais_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intranet +PET',
       initialRoute: '/home',
       routes: {
         '/home': (context) => MyHomePage(title: 'Intranet +PET'),
         '/ramais': (context) => BranchesView(),
       },
      theme: ThemeData(
        colorScheme: null,
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'Home'),
    );
  }
}

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
      appBar: const AppBarIntranet(),
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

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Image.asset('images/Logo_Nova-removebg-preview.png',
                          height: 140, width: 140),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      CardAbrirSistemas(
                          urlDoSistema: 'https://app.onepet.com.br/index.php',
                          caminhoDoIconeDoSistema: 'images/logo_onepet.png',
                          nomeDoSistema: 'ONEPET'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://maispetoficial.intelite.com.br/panel/entrar',
                          caminhoDoIconeDoSistema: 'images/logo_intelite.jpg',
                          nomeDoSistema: 'INTELITE'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://s15.chatguru.app/login?uri=%2Fdashboard%3F',
                          caminhoDoIconeDoSistema: 'images/logo_chat.jpg',
                          nomeDoSistema: 'CHATGURU'),
                      CardAbrirSistemas(
                          urlDoSistema: 'http://intelite.com.br/panel-dev/',
                          caminhoDoIconeDoSistema: 'images/logo_senhas.png',
                          nomeDoSistema: 'SENHAS'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      CardAbrirSistemas(
                          urlDoSistema: 'https://maispetplanosveterinarios.s4e.com.br/SYS/',
                          caminhoDoIconeDoSistema: 'images/logo_s4e.jpg',
                          nomeDoSistema: 'S4E'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://portal.p4x.srv.br/login',
                          caminhoDoIconeDoSistema: 'images/logo_p4x.png',
                          nomeDoSistema: 'P4X'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://webmail.maispetoficial.com.br/cpsess8522391036/3rdparty/roundcube/?_task=mail&_mbox=INBOX',
                          caminhoDoIconeDoSistema: 'images/webmail_logo.png',
                          nomeDoSistema: 'WEBMAIL'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://ucpro.algartelecom.com.br/cloudphonepro/#/',
                          caminhoDoIconeDoSistema: 'images/logo_algar.png',
                          nomeDoSistema: 'SQUAD'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      CardAbrirSistemas(
                          urlDoSistema: 'https://app.buzzlead.com.br/painel/auth#/',
                          caminhoDoIconeDoSistema: 'images/logo_buzzLead.png',
                          nomeDoSistema: 'BUZZLEAD'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://www.microsoft.com/pt-br/microsoft-teams/log-in',
                          caminhoDoIconeDoSistema: 'images/logo_teams.png',
                          nomeDoSistema: 'TEAMS'),
                      CardAbrirSistemas(
                          urlDoSistema: 'https://financas.f360.com.br/?redirect=%2fUsuario',
                          caminhoDoIconeDoSistema: 'images/logo_F360.JPG',
                          nomeDoSistema: 'F360'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
