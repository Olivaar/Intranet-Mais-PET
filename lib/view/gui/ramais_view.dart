import 'package:flutter/material.dart';

import '../components/appBar_intranet.dart';
import '../components/dropButton_ramais.dart';
import '../components/row_logoMaisPet_nomeDaView.dart';


class BranchesView extends StatefulWidget{

  @override
  _BranchesViewState createState() => _BranchesViewState();

}

class _BranchesViewState extends State<BranchesView>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AppBarIntranet(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back_teste.png'),
                  fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            color: const Color(0xffffffff).withOpacity(0.20),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const RowLogoMaisPet_NomeView(nomeDaView: 'RAMAIS'),
                DropButtonRamais(),
              ],
            ),
          ),
        ],
      )
    );
  }
}
