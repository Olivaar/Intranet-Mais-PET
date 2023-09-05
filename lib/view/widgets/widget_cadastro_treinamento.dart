import 'package:flutter/material.dart';
import 'package:intranet_maispet/control/guiController/treinamento_view_controller.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';

//TODO Se virar para atualizar o estado do DropButton

class WidgetCadastroTreinamento extends StatefulWidget{

  @override
  _WidgetCadastroTreinamento createState() => _WidgetCadastroTreinamento();

}

class _WidgetCadastroTreinamento  extends State<WidgetCadastroTreinamento>{

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController link1Controller = TextEditingController();
  TextEditingController link2Controller = TextEditingController();
  TextEditingController link3Controller = TextEditingController();
  TextEditingController link4Controller = TextEditingController();
  TextEditingController link5Controller = TextEditingController();

  TreinamentosViewController treinamentoController = TreinamentosViewController();

  @override
  Widget build(BuildContext context){
    return Container(
      width: 500,
      child: Card(
        elevation: 18.0,
        color: const Color(0xffFFD400),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NOVO TREINAMENTO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white
                    ),
                    textScaleFactor: 2,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tituloController,
                decoration: ThemeHelper().textInputDecoration(
                  'Titulo', 'Digite o titulo do Treinamento...'
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: null,
                controller: descricaoController,
                decoration: ThemeHelper().textInputDecoration(
                  'Descrição', 'Digite a descrição do Treinamento...'
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(16, 16,16, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black45)
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
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    TextFormField(
                      controller: link1Controller,
                      decoration: ThemeHelper().textInputDecoration(
                        'Vídeo 1', 'Cole aqui o link do 1 vídeo...'
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: link2Controller,
                      decoration: ThemeHelper().textInputDecoration(
                          'Vídeo 2', 'Cole aqui o link do 2 vídeo...'
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: link3Controller,
                      decoration: ThemeHelper().textInputDecoration(
                          'Vídeo 3', 'Cole aqui o link do 3 vídeo...'
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: link4Controller,
                      decoration: ThemeHelper().textInputDecoration(
                          'Vídeo 4', 'Cole aqui o link do 4 vídeo...'
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: link5Controller,
                      decoration: ThemeHelper().textInputDecoration(
                          'Vídeo 5', 'Cole aqui o link do 5 vídeo...'
                      ),
                    ),
                    const SizedBox(height: 7),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () async{
                  setState(() {
                    treinamentoController.salvarDadosTreinamento(
                      titulo: tituloController.text,
                      descricao: descricaoController.text,
                      link1: link1Controller.text,
                      link2: link2Controller.text,
                      link3: link3Controller.text,
                      link4: link4Controller.text,
                      link5: link5Controller.text,
                    );
                    treinamentoController.listaDeTreinamentos.add(tituloController.text);
                  });
                },
                icon: const Icon(Icons.save),
                label: const Text('SALVAR TREINAMENTO'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFFffff)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                    fontWeight: FontWeight.bold
                  ))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
