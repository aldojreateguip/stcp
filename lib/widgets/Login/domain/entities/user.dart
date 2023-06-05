class User {
  // final String id;
  final String nombre;
  final List<String> years;
  final List<String> tributes;
  final String token;
  final String refreshtoken;

  User(
      {required this.nombre,
      required this.years,
      required this.tributes,
      required this.token,
      required this.refreshtoken});
}
