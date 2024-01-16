import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/entities/treinamento.dart';

const treinamentosKey = 'treinamentos_list';

class TreinamentoRepository{
  final db = FirebaseFirestore.instance;
  final _collectionkey = 'treinamentos';

  Future<void> createTreinamento(Treinamento treinamento) async {
    final treinamentoJson = treinamento.toJson();
    db.collection(_collectionkey).doc(treinamento.id).set(treinamentoJson);
  }

  void updateTreinamento(String id, Treinamento updatedTreinamento) {
    updatedTreinamento.id = id;
    final updatedTreinamentoJson = updatedTreinamento.toJson();
    db.collection(_collectionkey).doc(id).update(updatedTreinamentoJson);
  }

  void deleteTreinamento(String id) async {
    await db.collection(_collectionkey).doc(id).delete();
  }
}