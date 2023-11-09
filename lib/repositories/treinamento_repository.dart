import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intranet_maispet/controller/treinamento_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/entities/treinamento.dart';

const treinamentosKey = 'treinamentos_list';


class TreinamentoRepository{
  final db = FirebaseFirestore.instance;
  TreinamentoController treinamentoController = TreinamentoController();

  SharedPreferences? sharedPreferences;

  Future<List<Treinamento>> getListaDeTreinamentos() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences?.getString(treinamentosKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Treinamento.fromJson(e)).toList();
  }

  void saveListaDeTreinamentos(List<Treinamento> treinamentos){
    final String jsonString = json.encode(treinamentos);
    sharedPreferences?.setString(treinamentosKey, jsonString);
  }

  void saveTreinamento(Treinamento treinamento){
    final treinamentoJson = treinamento.toJson();
    db.collection('treinamentos').doc(treinamento.id).set(treinamentoJson);
  }

  Future<List<Treinamento>>getTreinamentos() async {
    final treinamentos = await db.collection('treinamentos').get();

    final treinamentosList = treinamentos.docs
        .map((doc) => Treinamento.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return treinamentosList.isEmpty ? [] : treinamentosList;
  }

  void deleteTreinamento(String id) async {
    await db.collection('treinamentos').doc(id).delete();
  }

  void updateTreinamento(String id, Treinamento updatedTreinamento) {
    final updatedTreinamentoJson = updatedTreinamento.toJson();
    db.collection('treinamentos').doc(id).update(updatedTreinamentoJson);
  }
}