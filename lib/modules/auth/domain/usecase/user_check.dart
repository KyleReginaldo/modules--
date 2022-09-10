// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msg/modules/auth/domain/repository/auth_repository.dart';

class UserCheck {
  final AuthRepository repo;
  UserCheck({
    required this.repo,
  });

  Stream<User?> call() {
    return repo.userCheck();
  }
}
