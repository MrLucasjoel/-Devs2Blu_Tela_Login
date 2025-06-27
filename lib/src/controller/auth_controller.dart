import '../model/user_model.dart';
import '../services/auth_service.dart';

class AuthController {
  final AuthService _service = AuthService(); // Agora usa o singleton

  bool login(String email, String password) {
    return _service.login(email, password);
  }

  void register(UserModel user) {
    _service.register(user);
  }
}
