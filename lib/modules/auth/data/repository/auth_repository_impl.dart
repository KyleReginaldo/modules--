// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msg/modules/auth/data/datasource/abstract_remote_datasource.dart';
import 'package:msg/modules/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remote;
  AuthRepositoryImpl({
    required this.remote,
  });
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await remote.login(email: email, password: password);
    } catch (e) {
      print('ERROR OCCURED:: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await remote.logout();
    } catch (e) {
      print('ERROR OCCURED:: $e');
    }
  }

  @override
  Future<void> register(
      {required String email, required String password}) async {
    try {
      await remote.register(email: email, password: password);
    } catch (e) {
      print('ERROR OCCURED:: $e');
    }
  }

  @override
  Stream<User?> userCheck() {
    try {
      return remote.userCheck();
    } catch (e) {
      print('ERROR OCCURED:: $e');
      rethrow;
    }
  }
}
