import 'package:flutter/material.dart';
import 'package:intranet_maispet/controller/ramal_controller.dart';
import 'package:intranet_maispet/repositories/ramal_repository.dart';
import 'package:intranet_maispet/view/widgets/container_ramais.dart';

class WidgetTodosRamais extends StatefulWidget{

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
    final ramaisGyn = await ramalRepository.readListRamalByUnidade('+PET GOIÂNIA');
    final ramaisBsb = await ramalRepository.readListRamalByUnidade('+PET BRASÍLIA');
    final ramaisCamp = await ramalRepository.readListRamalByUnidade('+PET CAMPINAS');
    final ramaisAp = await ramalRepository.readListRamalByUnidade('+PET APARECIDA');

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