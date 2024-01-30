import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_repository_impl.dart';

final authProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authProvider)),
);

abstract class AuthRepository {
  User? get currentUser;
  Future<void> signInAnonymously();
}
