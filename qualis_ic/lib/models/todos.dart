class Todos {
  final String? issn;
  final String? periodico;
  final String? extratoCAPESComp;
  final String? extratoCAPES;
  final String? area;

  Todos({
    this.issn,
    this.periodico,
    this.extratoCAPESComp,
    this.extratoCAPES,
    this.area,
  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      issn: json['data'][0][0],
      periodico: json['data'][0][1],
      extratoCAPESComp: json['data'][0][2],
      extratoCAPES: json['data'][0][3],
      area: json['data'][0][4],
    );
  }
}
