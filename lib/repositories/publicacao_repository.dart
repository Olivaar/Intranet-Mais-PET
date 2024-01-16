import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';

class PublicacaoRepository{
  final firestore = FirebaseFirestore.instance;
  final collectionKey = 'publicacoes';

  Future<void> createPublicacao(Publicacao publicacao,) async{
    final publicacaoJson = publicacao.toJson();
    await firestore.collection(collectionKey).doc(publicacao.id).set(publicacaoJson);
  }

  void updatePublicacao(String id, Publicacao updatePublicacao){
    updatePublicacao.id = id;
    final updatePublicacaoJson = updatePublicacao.toJson();
    firestore.collection(collectionKey).doc(id).update(updatePublicacaoJson);
  }

  void deletePublicaao(String id) async{
    await firestore.collection(collectionKey).doc(id).delete();
  }
}