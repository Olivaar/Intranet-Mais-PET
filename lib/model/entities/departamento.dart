class Departamento{
  late String nomeDepartamento;

  Departamento({
    required this.nomeDepartamento,
  });

  Departamento.fromJson(Map<String, dynamic> json)
    : nomeDepartamento = json['nome'];

  Map<String, dynamic> toJson(){
    return{
      'nome': nomeDepartamento
    };
  }
}