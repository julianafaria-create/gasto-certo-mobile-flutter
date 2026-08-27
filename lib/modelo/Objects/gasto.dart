class Gasto {
  String descricao;
  String valor;
  String data;
  String categoria;

  Gasto({
    required this.descricao,
    required this.valor,
    required this.data,
    required this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'valor': valor,
      'data': data,
      'categoria': categoria,
    };
  }

  factory Gasto.fromMap(Map<String, dynamic> map) {
    return Gasto(
      descricao: map['descricao'],
      valor: map['valor'],
      data: map['data'],
      categoria: map['categoria'],
    );
  }
}