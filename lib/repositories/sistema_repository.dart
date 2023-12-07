import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/sistema.dart';
import 'dart:html';


class SistemaRepository{
  final firestore = FirebaseFirestore.instance;
  final collectionKey = 'sistemas';


  Future<void> createSistema(Sistema sistema,) async {
    final sistemaJson = sistema.toJson();
    await firestore.collection(collectionKey).doc(sistema.id).set(sistemaJson);
  }

  Future<List<Sistema>>readSistemas() async{
    final sistemas = await firestore.collection(collectionKey).get();

    final sistemasList = sistemas.docs
      .map((doc) => Sistema.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    return sistemasList.isEmpty ? [] : sistemasList;
  }

  void updateSistema(String id, Sistema updatedSistema){
    final updatedSistemaJson = updatedSistema.toJson();
    firestore.collection(collectionKey).doc(id).update(updatedSistemaJson);
  }

  void deleteSistema(String id) async{
    await firestore.collection(collectionKey).doc(id).delete();
  }


}