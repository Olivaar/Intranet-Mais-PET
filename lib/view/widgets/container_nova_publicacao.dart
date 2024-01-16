import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intranet_maispet/controller/publicacao_controller.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';
import 'package:intranet_maispet/repositories/publicacao_repository.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';
import '../colors.dart';

class ContainerNovaPublicacao extends StatefulWidget {

  Publicacao? updatePublicacao;

  ContainerNovaPublicacao({
    super.key,
    this.updatePublicacao,
  });

  @override
  State<ContainerNovaPublicacao> createState() => _ContainerNovaPublicacaoState();
}

class _ContainerNovaPublicacaoState extends State<ContainerNovaPublicacao> {
  final _formKey = GlobalKey<FormState>();

  String? _urlImage;
  Color _colorIcons = preto;

  bool _offstage = true;

  final PublicacaoController _publicacaoController = PublicacaoController();
  final PublicacaoRepository _publicacaoRepository = PublicacaoRepository();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _textoController = TextEditingController();
  Publicacao? auxPublicacao;

  void _updatePublicacao(){
    if(widget.updatePublicacao != null){
      _tituloController.text = widget.updatePublicacao!.titulo;
      _textoController.text = widget.updatePublicacao!.texto;
      _urlImage = widget.updatePublicacao!.urlImage;

      auxPublicacao = widget.updatePublicacao!;
    }
  }

  @override
  void initState(){
    super.initState();
    _updatePublicacao();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 10, 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: azulClaro.withOpacity(0.8),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'NOVA PUBLICAÇÃO',
                style: TextStyle(
                  color: branco,
                  fontWeight: FontWeight.bold,
                  fontSize: 26
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),

              TextFormField(
                controller: _tituloController,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Por favor, digite um titulo para publicação';
                  }
                  return null;
                },
                decoration: ThemeHelper().textInputDecoration(
                  'Titulo', 'Digite o titulo da publicação...',
                ),
              ),
              const SizedBox(height: 10,),

              TextFormField(
                controller: _textoController,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Por favor, figite o texto da publicação';
                  }
                  return null;
                },
                maxLines: null,
                decoration: ThemeHelper().textInputDecoration(
                  'Texto', 'Digite o texto da publicação...',
                ),
              ),
              const SizedBox(height: 10,),

              Offstage(
                offstage: _offstage,
                child: Image.network(
                  _urlImage != null ? _urlImage! :
                  'https://firebasestorage.googleapis.com/v0/b/maispet-testes.appspot.com/o/treinamentos%2Fimages%2FLogo_Nova-removebg-preview.png?alt=media&token=32a9dceb-148f-4705-9cb7-85670a35cb05',
                  height: 175,
                  width: 175,
                ),
              ),
              if(_offstage == false)
                const SizedBox(height: 10,),

              TextButton.icon(
                style: ThemeHelper().buttonStyle2(colorButton: branco),
                onPressed: () async {
                  PickedFile? pickedImage = await ImagePicker()
                      .getImage(source: ImageSource.gallery);
                  if(pickedImage == null) return;

                  _urlImage = await _publicacaoController.uploadImage(pickedImage);

                  if(_urlImage != null){
                    setState(() {
                      _colorIcons = verde;
                      _offstage = false;
                    });
                  }
                },
                icon: Icon(Icons.image_outlined, color: _colorIcons,),
                label: const Text('Imagem'),
              ),
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () async {

                      if(widget.updatePublicacao != null){

                        auxPublicacao!.titulo = _tituloController.text;
                        auxPublicacao!.texto = _textoController.text;
                        auxPublicacao!.urlImage = _urlImage!;

                        _publicacaoRepository.updatePublicacao(
                          auxPublicacao!.id, auxPublicacao!
                        );
                        Navigator.pop(context);
                        _clearAllCampos();
                      }

                      if(_formKey.currentState!.validate()){
                        Publicacao pub = Publicacao(
                          titulo: _tituloController.text,
                          texto: _textoController.text,
                          urlImage: _urlImage != null ? _urlImage! :
                          'https://firebasestorage.googleapis.com/v0/b/maispet-testes.appspot.com/o/treinamentos%2Fimages%2FLogo_Nova-removebg-preview.png?alt=media&token=32a9dceb-148f-4705-9cb7-85670a35cb05',
                          dataPublicacao: Timestamp.now()
                        );
                        await _publicacaoRepository.createPublicacao(pub);
                        setState(() {
                          _clearAllCampos();
                        });
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: ThemeHelper().buttonStyle2(colorButton: branco),
                  ),
                  const SizedBox(width: 10,),

                  TextButton.icon(
                    onPressed: () {
                      if(widget.updatePublicacao != null){
                        Navigator.pop(context);
                      }
                      setState(() {
                        _clearAllCampos();
                      });
                    },
                    icon: const Icon(Icons.delete_forever_outlined),
                    label: const Text('Cancelar'),
                    style: ThemeHelper().buttonStyle2(colorButton: branco),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }

  void _clearAllCampos(){
    _tituloController.clear();
    _textoController.clear();
    _urlImage = null;
    _offstage = true;
    _colorIcons = preto;
    widget.updatePublicacao = null;
  }
}
