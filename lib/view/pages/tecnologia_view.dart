import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import '../../controller/sistema_controller.dart';
import '../../model/entities/sistema.dart';
import '../../model/enums/sistema_page.dart';
import '../../repositories/sistema_repository.dart';
import '../widgets/appbar_intranet.dart';
import '../widgets/card_abrir_sistemas.dart';

class TecnologiaView extends StatefulWidget{
  const TecnologiaView({super.key});

  @override
  _TecnologiaViewState createState() => _TecnologiaViewState();
}

class _TecnologiaViewState  extends State<TecnologiaView>{

  SistemaRepository sistemaRepository = SistemaRepository();
  SistemaController sistemaController = SistemaController();

  final Stream<QuerySnapshot> _sistemasStream =
  FirebaseFirestore.instance.collection('sistemas').snapshots();

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
                  const SizedBox(height: 10,),
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
                          child: Text(
                            'TECNOLOGIA +PET',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox.fromSize(),

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
                            if(sistema.sistemaPage == SistemaPage.tecnologia){
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
        drawer: const DrawerTecnologia(),
      );
    }
    );
  }


}