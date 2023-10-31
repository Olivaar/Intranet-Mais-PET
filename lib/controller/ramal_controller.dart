import 'package:intranet_maispet/repositories/ramal_repository.dart';
import '../model/entities/ramal.dart';

class RamalController {
  RamalRepository ramalRepository = RamalRepository();

  List<String> listaDeUnidades = [
    '+PET GOIÂNIA',
    '+PET HOLDING',
    '+PET APARECIDA',
    '+PET BRASÍLIA',
    '+PET CAMPINAS',
    'TELEMED +PET',
    'TODOS OS RAMAIS'
  ];

  List<Ramal> ramais = [];
  List<Ramal> ramaisGyn = [];
  List<Ramal> ramaisBsb = [];
  List<Ramal> ramaisCamp = [];
  List<Ramal> ramaisAp = [];

  void createRamal(Ramal ramal){
    ramalRepository.createRamal(ramal);
  }

  Future<void> carregarRamais(String unidade) async{
    final ramaisBd = await ramalRepository.readListRamalByUnidade(unidade);
    ramais = ramaisBd;
  }

  void updateRamal(String id, String unidade, Ramal ramal){
    ramalRepository.updateRamal(id, unidade, ramal);
  }

  void deleteRamal(String id, String unidade){
    ramalRepository.deleteRamal(id, unidade);
  }
}