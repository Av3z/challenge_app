import 'package:challenge_app/app/auth/interfaces/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final AuthService _authService;

  _AuthController(this._authService);

  @observable
  bool isAuth = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(email, password);
      setAuth(true);
    } catch (e) {
      setAuth(false);
      setErrorMessage(e.toString());
    }
  }

  @action
  Future<void> signUp(String email, String password) async {
    try {
      await _authService.signUp(email, password);
      setAuth(true);
    } catch (e) {
      setAuth(false);
      setErrorMessage(e.toString());
    }
  }

  @action
  Future<void> logout() async {
    await _authService.logout();
    setAuth(false);
  }

  @action
  void setAuth(bool value) {
    isAuth = value;
  }

  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }
}
