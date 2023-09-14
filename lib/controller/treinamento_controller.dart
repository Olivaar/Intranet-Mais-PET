import '../model/entities/Treinamento.dart';

class TreinamentoController{
  List<Treinamento> listaDeTreinamentos = [];
  List<String> linksVideos = [];

  Treinamento salvarTreinamento({
    required String titulo,
    required String descricao,
    required String link1,
    required String link2,
  }){
    if(link1 != ''){
      linksVideos.add(link1);
    }
    if(link2 != ''){
      linksVideos.add(link2);
    }

    Treinamento treinamento = Treinamento(
      titulo: titulo,
      descricao: descricao,
      linksVideos: linksVideos
    );

    listaDeTreinamentos.add(treinamento);
    return treinamento;
  }

}