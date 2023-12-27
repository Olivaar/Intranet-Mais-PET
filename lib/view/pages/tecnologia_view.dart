import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';


class TecnologiaView extends StatefulWidget{

  @override
  _TecnologiaViewState createState() => _TecnologiaViewState();
}

class _TecnologiaViewState  extends State<TecnologiaView>{

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder( builder: (context, constraints) {
      return Scaffold(
        appBar: AppBarIntranet(
          appBarColor: const Color(0xff34B9D6),
          buttonColor: Colors.lightBlue.shade700,
          leading: true,
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
            SingleChildScrollView(
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textScaleFactor: 2,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox.fromSize(),
                ],
              ),
            ),
          ],
        ),
        drawer: const DrawerTecnologia(),
      );
    }
    );
  }


}