import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/model/entities/ramal.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';

class DialogRamal extends StatefulWidget {

  final String unidadeSelecionada;

  DialogRamal({
    super.key,
    required this.unidadeSelecionada,
  });

  @override
  State<DialogRamal> createState() => _DialogRamalState();
}

class _DialogRamalState extends State<DialogRamal> {
  TextEditingController localController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RamalController ramalController = RamalController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff34B9D6),
      title: const Text(
        'Novo Ramal',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: localController,
              decoration: ThemeHelper().textInputDecoration(
                'Local', 'Local do ramal',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: numeroController,
              decoration: ThemeHelper().textInputDecoration(
                'Ramal', 'Número do ramal',
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      Ramal ramal = Ramal(
                        unidade: widget.unidadeSelecionada,
                        local: localController.text,
                        numero: numeroController.text,
                      );
                      ramalController.createRamal(ramal);
                      localController.clear();
                      numeroController.clear();
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white,),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black,),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: const Text('Salvar'),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white,),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black,),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
