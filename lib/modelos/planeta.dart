class Planeta {
  int? id;
  String nome;
  double tamanho; // tamanho em quilômetros
  double distancia; // distância em quilômetros
  String? apelido;

  // Construtor da classe
  Planeta({
    this.id,
    required this.nome,
    required this.tamanho,
    required this.distancia,
    this.apelido,
  });

  // Construtor nomeado para criar um planeta "vazio"
  Planeta.vazio()
      : id = null,
        nome = '',
        tamanho = 0.0,
        distancia = 0.0,
        apelido = '';

  // Método para converter um planeta em um mapa (útil para persistência de dados ou exibição)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tamanho': tamanho,
      'distancia': distancia,
      'apelido': apelido,
    };
  }

  // Método para criar um planeta a partir de um mapa (útil para recuperação de dados)
  factory Planeta.fromMap(Map<String, dynamic> map) {
    return Planeta(
      id: map['id'],
      nome: map['nome'],
      tamanho: map['tamanho'],
      distancia: map['distancia'],
      apelido: map['apelido'],
    );
  }
}
