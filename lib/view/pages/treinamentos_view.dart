import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/pdf_controller.dart';
import 'package:intranet_maispet/controller/treinamento_controller.dart';
import 'package:intranet_maispet/model/entities/treinamento.dart';
import 'package:intranet_maispet/repositories/treinamento_repository.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/row_logoMaisPet_nomeDaView.dart';
import 'package:intranet_maispet/view/widgets/show_dialog_erro.dart';
import 'package:intranet_maispet/view/widgets/widget_treinamento.dart';
import '../widgets/theme_helper.dart';

class TreinamentosView extends StatefulWidget {
  const TreinamentosView({super.key});

  @override
  State<TreinamentosView> createState() => _TreinamentosViewState();

}

class _TreinamentosViewState extends State<TreinamentosView> {

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController link1Controller = TextEditingController();
  TextEditingController link2Controller = TextEditingController();
  TextEditingController senhaController = TextEditingController();


  TreinamentoController treinamentosController2 = TreinamentoController();
  PdfController pdfController = PdfController();
  final TreinamentoRepository treinamentoRepository = TreinamentoRepository();

  String? textErro;

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
                  width: 1200,
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                     for(Treinamento treinamento in treinamentosController2.listaDeTreinamentos)
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                backgroundColor: const Color(0xffFFD400),
                content: SizedBox(
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'NOVO TREINAMENTO',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,
                              ),
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: tituloController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Titulo', 'Digite o titulo do Treinamento...',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLines: null,
                          controller: descricaoController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Descrição', 'Digite a descrição do Treinamento...',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16,16, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black45),
                          ),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                                    child: Text(
                                      'Insira o link dos vídeos: (Min 1 - Max 5)',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              TextFormField(
                                controller: link1Controller,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Vídeo 1', 'Cole aqui o link do 1 vídeo...',
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: link2Controller,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Vídeo 2', 'Cole aqui o link do 2 vídeo...',
                                ),
                              ),
                              const SizedBox(height: 7),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          controller: senhaController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Senha para postagem', 'Digite a senha...',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton.icon(
                    onPressed: () async{
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel_outlined),
                    label: const Text('CANCELAR'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async{
                      if(tituloController.text.isEmpty){
                        showDialog(
                          context: context,
                          builder: (BuildContext contex){
                            return const ShowDialogErro(
                              title: 'ERRO!',
                              content: 'O campo titulo não pode estar vazio!',
                              textButton: 'Fechar',
                            );
                          }
                        );
                        return;
                      }
                      if(link1Controller.text.isEmpty){
                        showDialog(
                          context: context,
                          builder: (BuildContext contex){
                            return const ShowDialogErro(
                              title: 'ERRO!',
                              content: 'O treinamento precisa ter ao '
                                'menos 1 video!',
                              textButton: 'Fechar',
                            );
                          }
                        );
                        return;
                      }
                      if(senhaController.text == 'Tecnologia@20500'){
                        Treinamento tr = Treinamento(
                          titulo: tituloController.text,
                          descricao: descricaoController.text,
                          linksVideos: [link1Controller.text,],
                        );
                        if(link2Controller.text != ''){
                          tr.linksVideos.add(link2Controller.text);
                        }
                        setState(() {
                          treinamentoRepository.saveTreinamento(tr);
                          _carregarTreinamentos();
                        });
                        tituloController.clear();
                        descricaoController.clear();
                        link1Controller.clear();
                        link2Controller.clear();
                        senhaController.clear();

                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext contex){
                            return const ShowDialogErro(
                              title: 'ERRO!',
                              content: 'Senha incorreta!',
                              textButton: 'Fechar',
                            );
                          }
                        );
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('SALVAR'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: const Color(0xffFFD400),
        child: const Icon(Icons.add),
      ),
    );
  }
}
