// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:msg/modules/auth/domain/repository/auth_repository.dart';

class Logout {
  final AuthRepository repo;
  Logout({
    required this.repo,
  });

  Future<void> call() async {
    await repo.logout();
  }
}
