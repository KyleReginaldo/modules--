// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:msg/modules/auth/domain/repository/auth_repository.dart';

class Login {
  final AuthRepository repo;
  Login({
    required this.repo,
  });

  Future<void> call({required String email, required String password}) async {
    await repo.login(email: email, password: password);
  }
}
