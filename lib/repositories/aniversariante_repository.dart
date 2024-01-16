import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';

class AniversarianteRepository{
  final db = FirebaseFirestore.instance;
  final _collectionKey = 'aniversariantes';

   void createAniversariante(Aniversariante aniversariante){
     final aniversarianteJson = aniversariante.toJson();
     db.collection(_collectionKey).doc(aniversariante.id).set(aniversarianteJson);
   }

  Future<List<Aniversariante>>readAniversariantesDoMes() async{
    final aniversariantes = await db.collection('aniversariantes').get();

    final aniversariantesList = aniversariantes.docs
        .map((doc) => Aniversariante.fromJson(doc.data()))
        .toList();

    aniversariantesList.sort((a, b) {
      final dataAniversarioA = a.dataAniversario.toDate();
      final dataAniversarioB = b.dataAniversario.toDate();
      return dataAniversarioA.compareTo(dataAniversarioB);
    });

    return aniversariantesList.isEmpty ? [] : aniversariantesList;
  }

  Future<List<Aniversariante>> readAniversariantesDoDia() async {
    final now = DateTime.now();
    final dia = now.day;
    final mes = now.month;

    final aniversariantesSnapshot = await db.collection(_collectionKey).get();
    final aniversariantesList = aniversariantesSnapshot.docs
        .map((doc) => Aniversariante.fromJson(doc.data()))
        .where((aniversariante) {
      final dataAniversario = aniversariante.dataAniversario.toDate();
      return dataAniversario.day == dia && dataAniversario.month == mes;
    }).toList();

    return aniversariantesList;
  }

  void deleteAniversariante(String id) {
    db.collection('aniversariantes').doc(id).delete();
  }

  void deleteAllAniversariantes() async {
     final clearAniversariantes = await readAniversariantesDoMes();
     for(Aniversariante an in clearAniversariantes){
       deleteAniversariante(an.id);
     }
  }
}