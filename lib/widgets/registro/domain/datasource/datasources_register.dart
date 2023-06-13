abstract class RegisterDataSource {
  Future<void> step1(String name, String apellido, String email);
  Future<void> step2(
      String tipdoc, String ndoc, String telefono, String codContribuyente);
  Future<void> step3(String password, String confpassword);
}
