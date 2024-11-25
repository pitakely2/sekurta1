class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulation de délai
    return email == "test@example.com" && password == "password123";
  }
}
