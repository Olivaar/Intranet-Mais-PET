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

}