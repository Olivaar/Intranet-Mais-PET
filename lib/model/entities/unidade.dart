class Unidade{
  late String nome;

  Unidade({
    required this.nome,
  });

  Unidade.fromJson(Map<String, dynamic> json)
    : nome = json['nome'];

  Map<String, dynamic> toJson(){
    return{
      'nome': nome
    };
  }
}