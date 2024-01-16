import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/ramal.dart';

class RamalRepository{
  final db = FirebaseFirestore.instance;
  final _telefoniaKey = 'telefonia';
  final _ramalKey = 'ramais';

  void createRamal(Ramal ramal){
    final ramalJson = ramal.toJson();
    db.collection(_telefoniaKey).doc(ramal.unidade).collection(_ramalKey)
        .doc(ramal.id).set(ramalJson);
  }

  Future<List<Ramal>> readRamalByUnidade(String unidade) async{
    final ramais = await db.collection(_telefoniaKey).doc(unidade)
        .collection(_ramalKey).get();

    final ramaisList = ramais.docs
      .map((doc) => Ramal.fromJson(doc.data()))
      .toList();
    ramaisList.sort((a, b) => a.local.compareTo(b.local));

    return ramaisList.isEmpty ? [] : ramaisList;
  }

  void deleteRamal(String id, String unidade){
    db.collection(_telefoniaKey).doc(unidade).collection(_ramalKey)
        .doc(id).delete();
  }
}