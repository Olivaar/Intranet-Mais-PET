import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';

class DrawerTecnologia extends StatelessWidget {
  const DrawerTecnologia({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: azulEscuro,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: azulClaro,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'ADM Intranet +PET',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Image.asset('images/Logo_Nova-removebg-preview.png',
                  height: 100, width: 100,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'ADM RAMAIS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/admramais');
            },
          ),
          ListTile(
            title: const Text(
              'ADM ANIVERSARIANTES',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/rhaniversariantes');
            },
          ),
          ListTile(
            title: const Text(
              'ADM TREINAMENTOS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/admtreinamentos');
            },
          ),
          ListTile(
            title: const Text(
              'TECNOLOGIA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/tecnologia');
            },
          ),
        ],
      ),
    );
  }
}
