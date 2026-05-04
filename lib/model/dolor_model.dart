class Dolor {
  final String id;
  final String nombre;
  final String descripcion;
  final List<String> comerMas;
  final List<String> evitar;
  final String porQue;
  final String recetaTitulo;
  final String recetaPasos;
  final String redFlag;

  Dolor({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.comerMas,
    required this.evitar,
    required this.porQue,
    required this.recetaTitulo,
    required this.recetaPasos,
    required this.redFlag,
  });

  factory Dolor.fromJson(Map<String, dynamic> json) {
    return Dolor(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      comerMas: List<String>.from(json['comer_mas'] ?? []),
      evitar: List<String>.from(json['evitar'] ?? []),
      porQue: json['por_que'] ?? '',
      recetaTitulo: json['receta_titulo'] ?? '',
      recetaPasos: json['receta_pasos'] ?? '',
      redFlag: json['red_flag'] ?? '',
    );
  }
}
