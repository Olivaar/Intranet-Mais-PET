 import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/aniversariante_controller.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';
import 'package:intranet_maispet/model/enums/sistema_page.dart';
import 'package:intranet_maispet/repositories/aniversariante_repository.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/view/colors.dart';
import '../../controller/sistema_controller.dart';
import '../../model/entities/sistema.dart';
import '../../repositories/sistema_repository.dart';
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
  SistemaRepository sistemaRepository = SistemaRepository();
  SistemaController sistemaController = SistemaController();
  List<String> nomes = [];

  @override
  void initState() {
    super.initState();
    _carregarAniversariantesDoDia();
    _carregarSistemas();
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

  Future<void> _carregarSistemas() async {
    final sistemas = await sistemaRepository.readSistemas();
    setState(() {
      sistemaController.sistemas = sistemas;
    });
  }

  @override
  Widget build(BuildContext context) {

    String versao = '3.0.0';
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
                          color: branco,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.cake, color: Color(0xffFFD400),),
                            const SizedBox(width: 5,),
                            Text(
                              nomes[i],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Image.asset('images/Logo_Nova-removebg-preview.png',
                  height: 140, width: 140,
                ),
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
                        if(sis.sistemaPage == SistemaPage.home)
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xffFFD400),
        label: Text(versao),
        icon: const Icon(Icons.verified_user_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}