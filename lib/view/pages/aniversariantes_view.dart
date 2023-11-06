import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/alert_aniversariante_do_dia_background.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/row_view_aniversariante.dart';
import '../../controller/aniversariante_controller.dart';
import '../../model/entities/aniversariante.dart';
import '../../repositories/aniversariante_repository.dart';

class AniversariantesView extends StatefulWidget {
  const AniversariantesView({super.key});

  @override
  State<AniversariantesView> createState() => _AniversariantesViewState();
}

class _AniversariantesViewState extends State<AniversariantesView> with TickerProviderStateMixin{

  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  @override
  void initState() {
    super.initState();
    _carregarAniversariantes();
    _carregarAniversariantesDoDia();

    Future.delayed(const Duration(milliseconds: 3500)).then((_) {
      if(aniversarianteController.aniversariantesDoDia.isNotEmpty){
        showDialog(
          context: context,
          builder: (BuildContext contex){
            return const AlertAniversarianteDoDiaBackground();
          }
        );
      }
    });
  }

  Future<void> _carregarAniversariantes() async {
    final aniversariantes = await aniversarianteRepository.getListAniversariantes();
    setState(() {
      aniversarianteController.aniversariantes = aniversariantes;
    });
  }

  Future<void> _carregarAniversariantesDoDia() async{
    final aniversariantesDoDia = await aniversarianteRepository.getAniversariantesDoDia();
    setState(() {
      aniversarianteController.aniversariantesDoDia = aniversariantesDoDia;
    });
  }

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
          SingleChildScrollView(
            child: Column(
              children: [
                const RowLogoMaisPet_NomeView(nomeDaView: 'Aniversariantes'),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1664,
                    maxHeight: 450,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 175, right: 175),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFD400),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Text(
                          'Aniversariantes +PET',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5,),
                        for(
                          Aniversariante aniversariante in
                          aniversarianteController.aniversariantes
                        )
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: RowViewAniversariante(
                              aniversariante: aniversariante,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
