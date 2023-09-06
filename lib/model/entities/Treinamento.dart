class Treinamento {
  late String titulo;
  late String descricao;
  late List<String> linksVideos;

  Treinamento({
    required this.titulo,
    required this.descricao,
    required this.linksVideos
  });

  @override
  String toString() {
    return 'Treinamento{titulo: $titulo, descricao: $descricao, linksVideos: $linksVideos}';
  }
}