import '../model/user_model.dart';

class AuthService {
  // 🔒 Singleton: só uma instância do serviço no app todo
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  AuthService._internal() {
    // Usuário admin fixo
    _users.add(UserModel(email: 'admin@email.com', password: 'admin123'));
  }

  final List<UserModel> _users = [];

  bool login(String email, String password) {
    print("Tentando login com: $email / $password");
    for (var user in _users) {
      print("Usuário registrado: ${user.email}");
    }
    return _users.any((user) =>
    user.email == email && user.password == password);
  }

  void register(UserModel user) {
    print("Registrando novo usuário: ${user.email}");
    _users.add(user);
  }
}
