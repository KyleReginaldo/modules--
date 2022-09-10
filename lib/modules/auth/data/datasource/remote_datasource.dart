import 'package:firebase_auth/firebase_auth.dart';
import 'package:msg/modules/auth/data/datasource/abstract_remote_datasource.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<void> register(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Stream<User?> userCheck() {
    return _auth.userChanges();
  }
}
