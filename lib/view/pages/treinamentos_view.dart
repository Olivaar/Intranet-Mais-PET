import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/treinamento_controller.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/repositories/treinamento_repository.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/widget_treinamento.dart';


class TreinamentosView extends StatefulWidget {
  const TreinamentosView({super.key});

  @override
  State<TreinamentosView> createState() => _TreinamentosViewState();
}

class _TreinamentosViewState extends State<TreinamentosView> {

  TreinamentoController treinamentosController2 = TreinamentoController();
  TreinamentoRepository treinamentoRepository = TreinamentoRepository();

  @override
  void initState() {
    super.initState();
    _carregarTreinamentos();
  }

  Future<void> _carregarTreinamentos() async {
    final treinamentos = await treinamentoRepository.getTreinamentos();
    setState(() {
      treinamentosController2.listaDeTreinamentos = treinamentos;
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
                const RowLogoMaisPet_NomeView(nomeDaView: 'TREINAMENTOS',),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                     for(Treinamento treinamento in
                     treinamentosController2.listaDeTreinamentos)
                      WidgetTreinamento(
                        nomeDoTreinamento: treinamento.titulo,
                        resumoDoTreinamento: treinamento.descricao,
                        links: treinamento.linksVideos,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
