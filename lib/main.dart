import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/pages/admin_aniversariantes_view.dart';
import 'package:intranet_maispet/view/pages/admin_ramais_view.dart';
import 'package:intranet_maispet/view/pages/aniversariantes_view.dart';
import 'package:intranet_maispet/view/pages/home_view.dart';
import 'package:intranet_maispet/view/pages/ramais_view.dart';
import 'package:intranet_maispet/view/pages/tecnologia_view.dart';
import 'package:intranet_maispet/view/pages/treinamentos_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intranet +PET',
       initialRoute: '/home',
       routes: {
         '/home': (context) => const MyHomePage(title: 'Intranet +PET'),
         '/ramais': (context) => BranchesView(),
         '/tecnologia': (context) => TecnologiaView(),
         '/treinamentos': (context) => const TreinamentosView(),
         '/rhaniversariantes': (context) => const AdminAniversariantesView(),
         '/aniversariantes': (context) => const AniversariantesView(),
         '/admramais': (context) => const AdminRamaisView(),
       },
      theme: ThemeData(
        colorScheme: null,
        useMaterial3: true,
      ),
    );
  }
}


