import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/view/widgets/container_ramais.dart';

class WidgetTodosRamais extends StatefulWidget{
  const WidgetTodosRamais({super.key});


  @override
  State<WidgetTodosRamais> createState() => _WidgetTodosRamaisState();
}

class _WidgetTodosRamaisState extends State<WidgetTodosRamais> {
  RamalController ramalController = RamalController();
  RamalRepository ramalRepository = RamalRepository();

  @override
  void initState(){
    super.initState();
    _carregarTodosRamais();
  }

  Future<void> _carregarTodosRamais() async{
    final ramaisGyn = await ramalRepository.readRamalByUnidade('+PET GOIÂNIA');
    final ramaisBsb = await ramalRepository.readRamalByUnidade('+PET BRASÍLIA');
    final ramaisCamp = await ramalRepository.readRamalByUnidade('+PET CAMPINAS');
    final ramaisAp = await ramalRepository.readRamalByUnidade('+PET APARECIDA');

    setState(() {
      ramalController.ramaisGyn = ramaisGyn;
      ramalController.ramaisBsb = ramaisBsb;
      ramalController.ramaisCamp = ramaisCamp;
      ramalController.ramaisAp = ramaisAp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerRamais(ramais: ramalController.ramaisGyn, unidade: '+PET GOIÂNIA',),
        ContainerRamais(ramais: ramalController.ramaisBsb, unidade: '+PET BRASÍLIA',),
        ContainerRamais(ramais: ramalController.ramaisCamp, unidade: '+PET CAMPINAS',),
        ContainerRamais(ramais: ramalController.ramaisAp, unidade: '+PET APARECIDA',),
      ],
    );
  }
}