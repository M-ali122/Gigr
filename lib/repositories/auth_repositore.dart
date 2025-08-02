class AuthRepository {
  Future<bool> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock logic
    return email == "admin@gmail.com" && password == "123456";
  }


  Future<bool> isLoggedIn() async {
    // Simulate auth check
    await Future.delayed(const Duration(milliseconds: 500));
    return false; // change to true to simulate already logged in
  }

  Future<bool> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return name.isNotEmpty && email.isNotEmpty && password.length >= 6;
  }
}
