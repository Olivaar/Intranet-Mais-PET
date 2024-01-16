import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/ramal.dart';

import '../model/entities/departamento.dart';

class RamalRepository{
  final db = FirebaseFirestore.instance;

  void createRamal(Ramal ramal){
    final ramalJson = ramal.toJson();
    db.collection('telefonia').doc(ramal.unidade).collection('ramais').doc(ramal.id).set(ramalJson);
  }

  Future<List<Ramal>> readListRamalByUnidade(String unidade) async{
    final ramais = await db.collection('telefonia').doc(unidade).collection('ramais').get();

    final ramaisList = ramais.docs
      .map((doc) => Ramal.fromJson(doc.data() as Map<String, dynamic>))
      .toList();
    ramaisList.sort((a, b) => a.local.compareTo(b.local));

    return ramaisList.isEmpty ? [] : ramaisList;
  }

  Future<List<Departamento>> readListUnidades() async{
    final unidades = await db.collection('telefonia').get();

    final unidadesList = unidades.docs
      .map((doc) => Departamento.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    unidadesList.sort((a, b) => a.nomeDepartamento.compareTo(b.nomeDepartamento));

    return unidadesList.isEmpty ? [] : unidadesList;
  }

  void updateRamal(String id, String unidade, Ramal ramal){
    final ramalJson = ramal.toJson();
    db.collection('telefonia').doc(unidade).collection('ramais').doc(id).update(ramalJson);
  }

  void deleteRamal(String id, String unidade){
    db.collection('telefonia').doc(unidade).collection('ramais').doc(id).delete();
  }
}