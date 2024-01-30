import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamaica_online/main.dart';
import 'package:jamaica_online/repositories/auth/auth_repository.dart';
import 'package:jamaica_online/view_models/login_page_view_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref
        .watch(authRepositoryProvider)
        .currentUser
        ?.uid;

    return Scaffold(
      body: ref.watch(loginPageSignInFutureProvider).when(
        data: (data) {
          return MyHomePage(title: uid ?? 'No uid');
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text('エラー'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
