import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/alert_aniversariante_do_dia.dart';

class AlertAniversarianteDoDiaBackground extends StatefulWidget {
  const AlertAniversarianteDoDiaBackground({super.key});

  @override
  State<AlertAniversarianteDoDiaBackground> createState() => _AlertAniversarianteDoDiaBackgroundState();
}

class _AlertAniversarianteDoDiaBackgroundState extends State<AlertAniversarianteDoDiaBackground> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 16.0,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 470,
        height: 369,
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
          child: const AlertAniversarianteDoDia(),
        ),
      ),
    );
  }
}

