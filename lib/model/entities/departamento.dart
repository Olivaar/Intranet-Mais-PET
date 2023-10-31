class Departamento{
  late String nome;

  Departamento({
    required this.nome,
  });

  Departamento.fromJson(Map<String, dynamic> json)
    : nome = json['nome'];

  Map<String, dynamic> toJson(){
    return{
      'nome': nome
    };
  }
}