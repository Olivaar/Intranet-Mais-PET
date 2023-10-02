class Ramal {
  late String local;
  late String numero;

  final String keyLocal = 'local';
  final String keyNumero = 'numero';

  Ramal({
    required this.local,
    required this.numero,
  });

  Ramal.fromJson(Map<String, dynamic> json)
    : local = json['local'],
      numero = json['numero'];

  Map<String, dynamic> toJason(){
    return{
      'local': local,
      'numero': numero,
    };
  }
}