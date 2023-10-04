import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/unidade.dart';

class UnidadeRepository{
  final db = FirebaseFirestore.instance;

  Future<List<Unidade>> readListUnidades() async{
    final unidades = await db.collection('unidades').get();

    final unidadesList = unidades.docs
      .map((doc) => Unidade.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    unidadesList.sort((a, b) => a.nome.compareTo(b.nome));

    return unidadesList.isEmpty ? [] : unidadesList;
  }
}