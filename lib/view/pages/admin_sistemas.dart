import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intranet_maispet/controller/sistema_controller.dart';
import 'package:intranet_maispet/model/entities/sistema.dart';
import 'package:intranet_maispet/model/enums/sistema_background.dart';
import 'package:intranet_maispet/model/enums/sistema_page.dart';
import 'package:intranet_maispet/repositories/sistema_repository.dart';
import 'package:intranet_maispet/view/colors.dart';
import 'package:intranet_maispet/view/widgets/appBar_intranet.dart';
import 'package:intranet_maispet/view/widgets/drawer_tecnologia.dart';
import 'package:intranet_maispet/view/widgets/theme_helper.dart';


class AdminSistemas extends StatefulWidget {
  const AdminSistemas({super.key});

  @override
  State<AdminSistemas> createState() => _AdminSistemasState();
}

class _AdminSistemasState extends State<AdminSistemas> {

  SistemaRepository sistemaRepository = SistemaRepository();
  SistemaController sistemaController = SistemaController();

  TextEditingController nomeController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  String? urlImage;

  SistemaBackground? _sistemaBackground = SistemaBackground.normal;
  SistemaPage? _sistemaPage = SistemaPage.home;

  Color colorIcons = vermelho;


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
              )
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(32),
                  decoration: ThemeHelper().containerDecoration(),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(32),
                  decoration: ThemeHelper().containerDecoration(),
                  child: Form(
                    child: ListView(
                      children:  [
                        const Text(
                          'NOVO SISTEMA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: nomeController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Nome', 'Digite o nome do Sistema...',
                          ),
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: linkController,
                          decoration: ThemeHelper().textInputDecoration(
                            'Link', 'Cole o link do Sistema...',
                          ),
                        ),
                        const SizedBox(height: 5,),
                        ElevatedButton(
                          onPressed: () async {
                            PickedFile? pickedImage = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            if(pickedImage == null) return;

                            urlImage = await sistemaController.uploadImage(pickedImage);

                            if(urlImage != null){
                              setState(() {
                                colorIcons = verde;
                              });
                            }
                          },
                          style: ThemeHelper().buttonStyle2(colorButton: branco),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined, color: colorIcons,),
                              const SizedBox(width: 5,),
                              const Text('Escolher Imagem'),
                              const SizedBox(width: 5,),
                              Icon(Icons.check_circle_outline, color: colorIcons,)
                            ],
                          )
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: branco,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: preto),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Cor do BackGround',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              ListTile(
                                title: const Text('Branco'),
                                leading: Radio<SistemaBackground>(
                                  value: SistemaBackground.normal,
                                  groupValue: _sistemaBackground,
                                  onChanged: (SistemaBackground? value) {
                                    setState(() {
                                      _sistemaBackground = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Maispet'),
                                leading: Radio<SistemaBackground>(
                                  value: SistemaBackground.maispet,
                                  groupValue: _sistemaBackground,
                                  onChanged: (SistemaBackground? value) {
                                    setState(() {
                                      _sistemaBackground = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Telemed'),
                                leading: Radio<SistemaBackground>(
                                  value: SistemaBackground.telemed,
                                  groupValue: _sistemaBackground,
                                  onChanged: (SistemaBackground? value) {
                                    setState(() {
                                      _sistemaBackground = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: branco,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: preto),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Pagina de Exibição',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              ListTile(
                                title: const Text('Home'),
                                leading: Radio<SistemaPage>(
                                  value: SistemaPage.home,
                                  groupValue: _sistemaPage,
                                  onChanged: (SistemaPage? value) {
                                    setState(() {
                                      _sistemaPage = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Tecnologia'),
                                leading: Radio<SistemaPage>(
                                  value: SistemaPage.tecnologia,
                                  groupValue: _sistemaPage,
                                  onChanged: (SistemaPage? value) {
                                    setState(() {
                                      _sistemaPage = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        ElevatedButton.icon(
                          onPressed: (){
                            Sistema sistema = Sistema(
                              nome:  nomeController.text,
                              link: linkController.text,
                              urlImage: urlImage!,
                              sistemaBackground: _sistemaBackground!,
                              sistemaPage: _sistemaPage!,
                            );
                            sistemaRepository.createSistema(sistema);
                            setState(() {
                              nomeController.clear();
                              linkController.clear();
                              colorIcons = vermelho;
                            });
                          },
                          icon: const Icon(Icons.save),
                          label: const Text(
                            'Salvar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: preto,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerTecnologia(),
    );
  }
}
