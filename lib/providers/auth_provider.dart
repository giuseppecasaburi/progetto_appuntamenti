import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthNotifier(authService);
});

class AuthNotifier extends StateNotifier<User?> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(null);

  Future<bool> login(String email, String password) async {
    final token = await _authService.login(email, password);

    if (token != null) {
      state = User(email: email, token:token);
      return true;
    } 
    
    return false;
  }

  void logout() {
    state = null;
  }
}