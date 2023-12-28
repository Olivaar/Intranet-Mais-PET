import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/container_novo_treinamento.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/listView_adm_treinamentos.dart';

class AdminTreinamentosView extends StatefulWidget {
  const AdminTreinamentosView({super.key});

  @override
  State<AdminTreinamentosView> createState() => _AdminTreinamentosViewState();
}

class _AdminTreinamentosViewState extends State<AdminTreinamentosView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(
        appBarColor: azulClaro,
        buttonColor: azulEscuro,
        leading: true,
      ),
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
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
                color: azulEscuro.withOpacity(0.8),
                child: const ListViewAdmTreinamentos(),
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
                color: branco.withOpacity(0.8),
                child: ContainerNovoTreinamento(),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}


