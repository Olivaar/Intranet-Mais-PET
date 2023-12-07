import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/publicacao.dart';

class PublicacaoRepository{
  final firestore = FirebaseFirestore.instance;
  final collectionKey = 'publicacoes';

  Future<void> createPublicacao(Publicacao publicacao,) async{
    final publicacaoJson = publicacao.toJson();
    await firestore.collection(collectionKey).doc(publicacao.id).set(publicacaoJson);
  }

  Future<List<Publicacao>>readPublicacoes() async{
    final publicacoes = await firestore.collection(collectionKey).get();

    final publicacoesList = publicacoes.docs
      .map((doc) => Publicacao.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    return publicacoesList.isEmpty ? [] : publicacoesList;
  }

  void updatePublicacao(String id, Publicacao updatePublicacao){
    final updatePublicacaoJson = updatePublicacao.toJson();
    firestore.collection(collectionKey).doc(id).update(updatePublicacaoJson);
  }

  void deletePublicaao(String id) async{
    await firestore.collection(collectionKey).doc(id).delete();
  }
}