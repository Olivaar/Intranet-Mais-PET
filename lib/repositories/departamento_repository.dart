import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/departamento.dart';

class DepartamentoRepository{
  final db = FirebaseFirestore.instance;

  Future<List<Departamento>> readListDepartamentos() async{
    final departamentos = await db.collection('departamentos').get();

    final departamentosList = departamentos.docs
      .map((doc) => Departamento.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    departamentosList.sort((a, b) => a.nomeDepartamento.compareTo(b.nomeDepartamento));

    return departamentosList.isEmpty ? [] : departamentosList;
  }
}