import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import '../../controller/treinamento_controller.dart';
import '../../model/entities/treinamento.dart';
import '../../repositories/treinamento_repository.dart';
import '../widgets/theme_helper.dart';

class AdminTreinamentosView extends StatefulWidget {
  const AdminTreinamentosView({super.key});

  @override
  State<AdminTreinamentosView> createState() => _AdminTreinamentosViewState();
}

class _AdminTreinamentosViewState extends State<AdminTreinamentosView> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController link1Controller = TextEditingController();
  TextEditingController link2Controller = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  TreinamentoController treinamentosController2 = TreinamentoController();
  final TreinamentoRepository treinamentoRepository = TreinamentoRepository();
  bool update = false;
  String? id;

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
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      child: Container(
                        width: 500,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                          color: branco,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const Text(
                              'LISTA DE TREINAMENTOS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, color: azulEscuro,
                              ),
                              textScaleFactor: 2,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            for( Treinamento treinamento1 in
                            treinamentosController2.listaDeTreinamentos)
                              Container(
                                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: azulEscuro,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Text(
                                        treinamento1.titulo,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: preto,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        tituloController.text = treinamento1.titulo;
                                        descricaoController.text = treinamento1.descricao;
                                        link1Controller.text = treinamento1.linksVideos[0];
                                        if(treinamento1.linksVideos.length > 1){
                                          link2Controller.text = treinamento1.linksVideos[1];
                                        };
                                        id = treinamento1.id;
                                        update = true;
                                      },
                                      icon: const Icon(Icons.edit, color: preto,),
                                    ),
                                    IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        treinamentoRepository.deleteTreinamento(treinamento1.id);
                                        setState(() {
                                          _carregarTreinamentos();
                                        });
                                      },
                                      icon: const Icon(Icons.delete, color: preto,),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
                color: branco.withOpacity(0.8),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 500,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                          color: azulEscuro,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              const Text(
                                'NOVO TREINAMENTO',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, color: branco,
                                ),
                                textScaleFactor: 2,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, digite o titulo do treinamento';
                                  }
                                  return null;
                                },
                                controller: tituloController,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Titulo', 'Digite o titulo do Treinamento...',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, digite a descrição do treinamento';
                                  }
                                  return null;
                                },
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
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Insira o link dos vídeos: (Min 1 - Max 5)',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(height: 7),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, digite ao menos 1 link';
                                        }
                                        return null;
                                      },
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, digite a senha';
                                  }
                                  return null;
                                },
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
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async{
                        if (_formKey.currentState!.validate() && update == false){
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
                            _clearAllCampos();
                          });
                        } else if (_formKey.currentState!.validate()){
                          List<String> links = [link1Controller.text,];
                          if(link2Controller.text != ''){
                            links.add(link2Controller.text);
                          }
                          setState(() {
                            final db = FirebaseFirestore.instance;
                            db.collection('treinamentos').doc(id).update(
                              {
                                'titulo': tituloController.text,
                                'descricao': descricaoController.text,
                                'linksVideos': links,
                              },
                            );
                            _carregarTreinamentos();
                            _clearAllCampos();
                            update = false;
                          });
                        }
                      },
                      icon: const Icon(Icons.save, color: preto,),
                      label: const Text(
                        'Salvar',
                        style: TextStyle(fontWeight: FontWeight.bold, color: preto),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(azulEscuro),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
  void _clearAllCampos(){
    tituloController.clear();
    descricaoController.clear();
    link1Controller.clear();
    link2Controller.clear();
    senhaController.clear();
  }
}


