import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/sistema.dart';

class SistemaRepository{
  final firestore = FirebaseFirestore.instance;
  final collectionKey = 'sistemas';

  Future<void> createSistema(Sistema sistema,) async {
    final sistemaJson = sistema.toJson();
    await firestore.collection(collectionKey).doc(sistema.id).set(sistemaJson);
  }

  void updateSistema(String id, Sistema updatedSistema){
    final updatedSistemaJson = updatedSistema.toJson();
    firestore.collection(collectionKey).doc(id).update(updatedSistemaJson);
  }

  void deleteSistema(String id) async{
    await firestore.collection(collectionKey).doc(id).delete();
  }
}
