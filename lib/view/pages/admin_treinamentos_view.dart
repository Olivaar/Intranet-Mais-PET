import 'package:flutter/material.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import '../widgets/theme_helper.dart';

class AdminTreinamentosView extends StatefulWidget {
  const AdminTreinamentosView({super.key});

  @override
  State<AdminTreinamentosView> createState() => _AdminTreinamentosViewState();
}

class _AdminTreinamentosViewState extends State<AdminTreinamentosView> {

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController link1Controller = TextEditingController();
  TextEditingController link2Controller = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIntranet(
        appBarColor: azulClaro,
        buttonColor: azulEscuro,
        leading: true,
      ),
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            color: azulEscuro,
            child: Center(
              child: Text('teste'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            color: branco,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 500,
                decoration: BoxDecoration(
                  color: azulClaro,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'NOVO TREINAMENTO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white,
                        ),
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
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
            ),
          ),
        ],
      ),
    );
  }
}
