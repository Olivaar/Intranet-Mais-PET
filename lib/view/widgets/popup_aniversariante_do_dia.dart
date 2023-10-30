import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_maispet/view/widgets/card_aniversariante_do_dia.dart';
import '../../controller/aniversariante_controller.dart';
import '../../model/entities/aniversariante.dart';
import '../../repositories/aniversariante_repository.dart';

class PopUpAniversarianteDoDia extends StatefulWidget {
  const PopUpAniversarianteDoDia({super.key});

  @override
  State<PopUpAniversarianteDoDia> createState() => _PopUpAniversarianteDoDiaState();
}

class _PopUpAniversarianteDoDiaState extends State<PopUpAniversarianteDoDia> {

  AniversarianteController aniversarianteController = AniversarianteController();
  AniversarianteRepository aniversarianteRepository = AniversarianteRepository();

  String textTitulo = 'Aniversariante do Dia!';

  @override
  void initState() {
    super.initState();
    _carregarAniversariantesDoDia();
  }

  Future<void> _carregarAniversariantesDoDia() async{
    final aniversariantesDoDia = await aniversarianteRepository.getAniversariantesDoDia();
    setState(() {
      aniversarianteController.aniversariantesDoDia = aniversariantesDoDia;
      if(aniversariantesDoDia.length > 1){
        textTitulo = 'Aniversariantes do Dia!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xffFFD400).withOpacity(0.9),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6), // Cor da sombra
                    blurRadius: 5.0, // Raio do desfoque da sombra
                    offset: const Offset(0, 4), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Text(
                textTitulo,
                style: GoogleFonts.merriweather(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(Aniversariante an in aniversarianteController.aniversariantesDoDia)
              CardAniversarianteDoDia(
                nome: an.nomeSobrenome,
                cargo: an.cargo,
                unidade: an.unidade,
              ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 410,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Cor da sombra
                    blurRadius: 10.0, // Raio do desfoque da sombra
                    offset: const Offset(0, 4), // Deslocamento da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Text(
                'A equipe +PET deseja muitas felicidades!',
                style: GoogleFonts.merriweather(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
