import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/pages/home_view.dart';
import 'package:intranet_maispet/view/pages/ramais_view.dart';
import 'package:intranet_maispet/view/pages/tecnologia_view.dart';
import 'package:intranet_maispet/view/pages/treinamentos_view.dart';
import 'package:intranet_maispet/view/pages/treinamentos_view2.dart';

void main() {
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
         '/home': (context) => MyHomePage(title: 'Intranet +PET'),
         '/ramais': (context) => BranchesView(),
         '/tecnologia': (context) => TecnologiaView(),
         '/treinamentos': (context) => TreinamentosView(),
         '/teste': (context) => TreinamentosView2(),
       },
      theme: ThemeData(
        colorScheme: null,
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'Home'),
    );
  }
}


