import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamaica_online/repositories/auth/auth_repository.dart';

final authProvider = Provider<FirebaseAuth>(
    (_) => FirebaseAuth.instance
);

final authRepositoryImplProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.watch(authProvider))
);

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