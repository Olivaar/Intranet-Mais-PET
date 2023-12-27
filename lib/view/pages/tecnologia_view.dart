import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import '../../controller/sistema_controller.dart';
import '../../model/entities/sistema.dart';
import '../../model/enums/sistema_page.dart';
import '../../repositories/sistema_repository.dart';
import '../widgets/appBar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';


class TecnologiaView extends StatefulWidget{

  @override
  _TecnologiaViewState createState() => _TecnologiaViewState();
}

class _TecnologiaViewState  extends State<TecnologiaView>{

  SistemaRepository sistemaRepository = SistemaRepository();
  SistemaController sistemaController = SistemaController();

  @override
  void initState() {
    super.initState();
    _carregarSistemas();
  }

  Future<void> _carregarSistemas() async {
    final sistemas = await sistemaRepository.readSistemas();
    setState(() {
      sistemaController.sistemas = sistemas;
    });
  }

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
                  Container(
                      width: 900,
                      padding: const EdgeInsets.all(16),
                      // margin: const EdgeInsets.all(32),
                      child: Wrap(
                        runSpacing: 6,
                        spacing:  6,
                        alignment: WrapAlignment.center,
                        children: [
                          for(Sistema sis in sistemaController.sistemas)
                            if(sis.sistemaPage == SistemaPage.tecnologia)
                              CardAbrirSistemas(
                                urlDoSistema: sis.link,
                                urlImage: sis.urlImage,
                                nomeDoSistema: sis.nome,
                                sistemaBackground: sis.sistemaBackground,
                                sistemaPage: sis.sistemaPage,
                              )
                        ],
                      )
                  )
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