import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';
import '../../controller/treinamento_controller.dart';
import '../../model/entities/treinamento.dart';
import '../../repositories/treinamento_repository.dart';
import '../colors.dart';

class ContainerNovoTreinamento extends StatefulWidget {
  final Treinamento? updateTreinamento;

  const ContainerNovoTreinamento({
    super.key,
    this.updateTreinamento,
  });

  @override
  State<ContainerNovoTreinamento> createState() => _ContainerNovoTreinamentoState();
}

class _ContainerNovoTreinamentoState extends State<ContainerNovoTreinamento> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController link1Controller = TextEditingController();
  TextEditingController link2Controller = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final TreinamentoController treinamentoController = TreinamentoController();
  final TreinamentoRepository treinamentoRepository = TreinamentoRepository();

  String? urlImage;
  String? urlPdf;
  Color colorIconsImage = vermelho;
  Color colorIconsPdf = vermelho;

  bool update = false;

  void _update(){
    if(widget.updateTreinamento != null){
      tituloController.text = widget.updateTreinamento!.titulo;
      descricaoController.text = widget.updateTreinamento!.descricao;
      link1Controller.text = widget.updateTreinamento!.linksVideos[0];
      if(widget.updateTreinamento!.linksVideos.length > 1){
        link2Controller.text = widget.updateTreinamento!.linksVideos[1];
      }
      colorIconsImage = amareloClaro;
      colorIconsPdf = amareloClaro;
      update = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40,),
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
                    padding: const EdgeInsets.fromLTRB(16, 10,16, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Insira o link dos vídeos: (Min 1 - Max 2)',
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
                      ],
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            PickedFile? pickedImage = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            if(pickedImage == null) return;

                            urlImage = await treinamentoController
                                .uploadImage(pickedImage);

                            if(urlImage != null){
                              setState(() {colorIconsImage = verde;});
                            }
                          },
                          style: ThemeHelper().buttonStyle2(
                            colorButton: azulEscuro,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: colorIconsImage,
                              ),
                              const SizedBox(width: 5,),

                              const Text('Escolher Imagem'),
                              const SizedBox(width: 5,),

                              Icon(
                                Icons.check_circle_outline,
                                color: colorIconsImage,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 7),

                        ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? pickedPdf = await
                            FilePickerWeb.platform.pickFiles();

                            if(pickedPdf != null){
                              urlPdf = await treinamentoController
                                .uploadPdf(pickedPdf);
                            }

                            setState(() {colorIconsPdf = verde;});
                          },
                          style: ThemeHelper().buttonStyle2(
                            colorButton: azulEscuro,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: colorIconsPdf,
                              ),
                              const SizedBox(width: 5,),

                              const Text('Escolher PDF'),
                              const SizedBox(width: 5,),

                              Icon(
                                Icons.check_circle_outline,
                                color: colorIconsPdf,
                              ),
                            ],
                          )
                        ),

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
                urlImage: urlImage,
                urlPdf: urlPdf,
              );

              if(link2Controller.text != ''){
                tr.linksVideos.add(link2Controller.text);
              }

              setState(() {
                treinamentoRepository.createTreinamento(tr);
                _clearAllCampos();
              });
            } else if (_formKey.currentState!.validate() && update == true){
              Treinamento tr = Treinamento(
                titulo: tituloController.text,
                descricao: descricaoController.text,
                linksVideos: [link1Controller.text,],
                urlImage: urlImage,
                urlPdf: urlPdf,
              );

              if(link2Controller.text != ''){
                tr.linksVideos.add(link2Controller.text);
              }

              setState(() {
                treinamentoRepository.updateTreinamento(
                    widget.updateTreinamento!.id, tr
                );

                _clearAllCampos();

                if(update){
                  Navigator.pop(context);
                }

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
        const SizedBox(height: 7),

        ElevatedButton.icon(
          onPressed: () async{
            setState(() {
              _clearAllCampos();
              if(update){
                Navigator.pop(context);
              }
              update = false;
            });
          },
          icon: const Icon(Icons.cancel_outlined, color: preto,),
          label: const Text(
            'Cancelar',
            style: TextStyle(fontWeight: FontWeight.bold, color: preto),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(azulEscuro),
          ),
        ),

      ],
    );
  }

  void _clearAllCampos(){
    tituloController.clear();
    descricaoController.clear();
    link1Controller.clear();
    link2Controller.clear();
    senhaController.clear();
    colorIconsImage = vermelho;
    colorIconsPdf = vermelho;
  }
}
