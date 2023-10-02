import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import '../../controller/aniversariante_controller.dart';
import '../../model/entities/aniversariante.dart';
import '../../repositories/aniversariante_repository.dart';
import '../widgets/popup_aniversariante_do_dia.dart';

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
            return AlertDialog(
              elevation: 16.0,
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: 430,
                height: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6), // Cor da sombra
                      blurRadius: 5.0, // Raio do desfoque da sombra
                      offset: const Offset(0, 8), // Deslocamento da sombra (horizontal, vertical)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFFD400),
                      Color(0xffffffff),
                    ],
                  ),
                ),
                child: AnimatedBackground(
                  vsync: this,
                  behaviour: RandomParticleBehaviour(
                    options: ParticleOptions(
                      spawnMaxRadius: 40,
                      particleCount: 30,
                      spawnOpacity: 0.1,
                      spawnMinSpeed: 10,
                      spawnMaxSpeed: 50,
                      baseColor: Colors.black,
                      image: Image.asset('assets/images/bolo-de-aniversario.png'),
                    ),
                  ),
                  child: const PopUpAniversarianteDoDia(),
                ),
              ),
            );
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
                Container(
                  margin: const EdgeInsets.only(left: 175, right: 175),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFD400),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Aniversariantes +PET',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 2
                        ),
                        const SizedBox(height: 5,),
                        for(Aniversariante aniversariante in aniversarianteController.aniversariantes)
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Text(aniversariante.nomeSobrenome),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 150,
                                  child: Text(
                                    aniversarianteController.dataAniversarioToString(
                                      aniversariante.dataAniversario,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 250,
                                  child: Text(aniversariante.cargo),
                                ),
                                const SizedBox(width: 6,),
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Text(aniversariante.unidade),
                                ),
                              ],
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
