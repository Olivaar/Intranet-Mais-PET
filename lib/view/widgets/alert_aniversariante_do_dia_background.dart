import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/widgets/alert_aniversariante_do_dia_body.dart';

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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 5.0,
              offset: const Offset(0, 8),
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
        child: const AlertAniversarianteDoDiaBody(),
      ),
    );
  }
}

