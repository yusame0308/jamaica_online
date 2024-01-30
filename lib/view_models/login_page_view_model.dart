import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth/auth_repository.dart';

final loginPageSignInFutureProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    await ref.watch(loginPageViewModelProvider).signInAnonymously();
  },
);

final loginPageViewModelProvider = Provider<LoginPageViewModel>(
  (ref) => LoginPageViewModel(ref.watch(authRepositoryProvider)),
);

class LoginPageViewModel {
  LoginPageViewModel(this._authRepository);
  final AuthRepository _authRepository;

  Future<void> signInAnonymously() async {
    await _authRepository.signInAnonymously();
  }
}
