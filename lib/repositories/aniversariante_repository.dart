import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/model/entities/aniversariante.dart';


class AniversarianteRepository{
  final db = FirebaseFirestore.instance;

   void saveAniversariante(Aniversariante aniversariante){
     final aniversarianteJson = aniversariante.toJson();
     db.collection('aniversariantes').doc(aniversariante.id).set(aniversarianteJson);
   }

  Future<void> saveAndUpdateAniversariante(Aniversariante aniversariante) async {
    final aniversarianteJson = aniversariante.toJson();
    final docRef = await db.collection('aniversariantes').add(aniversarianteJson);
    final String newId = docRef.id;
    db.collection('aniversariantes').doc(newId).update({'id': newId});
  }

  void saveListAniversariantes(List<Aniversariante> aniversariantes){
    for(Aniversariante aniversariante in aniversariantes){
     saveAniversariante(aniversariante);
    }
  }

  Future<List<Aniversariante>> getAniversariantesDoDia() async {
    final now = DateTime.now();
    final dia = now.day;
    final mes = now.month;

    final aniversariantesSnapshot = await db.collection('aniversariantes').get();
    final aniversariantesList = aniversariantesSnapshot.docs
        .map((doc) => Aniversariante.fromJson(doc.data() as Map<String, dynamic>))
        .where((aniversariante) {
      final dataAniversario = aniversariante.dataAniversario.toDate();
      return dataAniversario.day == dia && dataAniversario.month == mes;
    }).toList();

    return aniversariantesList;
  }

  void updateAniversariante(String id, Aniversariante updatedAniversariante) {
    final updatedAniversarianteJson = updatedAniversariante.toJson();
    db.collection('aniversariantes').doc(id).update(updatedAniversarianteJson);
  }

  void deleteAniversariante(String id) {
    db.collection('aniversariantes').doc(id).delete();
  }

  Future<List<Aniversariante>>getListAniversariantes() async{
    final aniversariantes = await db.collection('aniversariantes').get();

    final aniversariantesList = aniversariantes.docs
      .map((doc) => Aniversariante.fromJson(doc.data() as Map<String, dynamic>))
      .toList();

    aniversariantesList.sort((a, b) {
      final dataAniversarioA = a.dataAniversario.toDate();
      final dataAniversarioB = b.dataAniversario.toDate();
      return dataAniversarioA.compareTo(dataAniversarioB);
    });

    return aniversariantesList.isEmpty ? [] : aniversariantesList;
  }
}