import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/departamento.dart';

class DepartamentoRepository{
  final db = FirebaseFirestore.instance;
  final _collectionKey = 'departamentos';

  Future<List<Departamento>> readDepartamentos() async{
    final departamentos = await db.collection(_collectionKey).get();

    final departamentosList = departamentos.docs
      .map((doc) => Departamento.fromJson(doc.data()))
      .toList();

    departamentosList.sort((a, b) => a.nomeDepartamento.compareTo(b.nomeDepartamento));

    return departamentosList.isEmpty ? [] : departamentosList;
  }
}