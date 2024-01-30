import 'package:firebase_auth/firebase_auth.dart';
import 'package:jamaica_online/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }
}
