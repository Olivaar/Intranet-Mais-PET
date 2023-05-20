import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/components/appBar.dart';
import 'package:intranet_maispet/view/components/infoUserCard.dart';
import 'package:intranet_maispet/view/components/redirectSystemButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intranet',
      theme: ThemeData(
        colorScheme: null,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff09D0E4),
      appBar: const appBar(),
      body: Center(
        child: Column(
          children: <Widget> [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                infoUserCard(
                    userName: 'olivar.tamele', computerName: 'SP-NB-TI-001')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.asset('images/Logo_Nova-removebg-preview.png',
                    height: 140, width: 140)
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                redirectSystemButton(
                    url: 'https://app.onepet.com.br/index.php',
                    referencePathImage: 'images/logo_onepet.png',
                    text: 'ONEPET'),
                redirectSystemButton(
                    url: 'https://maispetoficial.intelite.com.br/panel/entrar',
                    referencePathImage: 'images/logo_intelite.jpg',
                    text: 'INTELITE'),
                redirectSystemButton(
                    url: 'https://s15.chatguru.app/login?uri=%2Fdashboard%3F',
                    referencePathImage: 'images/logo_chat.jpg',
                    text: 'CHATGURU'),
                redirectSystemButton(
                    url: 'http://intelite.com.br/panel-dev/',
                    referencePathImage: 'images/logo_senhas.png',
                    text: 'SENHAS'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                redirectSystemButton(
                    url: 'https://maispetplanosveterinarios.s4e.com.br/SYS/',
                    referencePathImage: 'images/logo_s4e.jpg',
                    text: 'S4E'),
                redirectSystemButton(
                    url: 'https://portal.p4x.srv.br/login',
                    referencePathImage: 'images/logo_p4x.png',
                    text: 'P4X'),
                redirectSystemButton(
                    url: 'https://webmail.grupoprovider.com.br/',
                    referencePathImage: 'images/webmail_logo.png',
                    text: 'WEBMAIL'),
                redirectSystemButton(
                    url: 'https://ucpro.algartelecom.com.br/cloudphonepro/#/',
                    referencePathImage: 'images/logo_algar.png',
                    text: 'SQUAD'),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
