import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg/modules/auth/domain/usecase/login.dart';
import 'package:msg/modules/auth/domain/usecase/logout.dart';
import 'package:msg/modules/auth/domain/usecase/register.dart';
import 'package:msg/modules/auth/domain/usecase/user_check.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login, this._logout, this._register, this._userCheck)
      : super(AuthInitial());

  final Login _login;
  final Logout _logout;
  final Register _register;
  final UserCheck _userCheck;

  void login({required String email, required String password}) async {
    emit(Authenticating());
    Future.delayed(const Duration(seconds: 1), () async {
      await _login(email: email, password: password);
    });
  }

  void userCheck() async {
    final userStream = _userCheck();

    userStream.listen((event) {
      emit(Authenticating());

      if (event != null) {
        emit(Authenticated(user: event));
      } else {
        emit(UnAuthenticated());
      }
    });
  }

  void logout() async {
    await _logout();
  }

  void register({required String email, required String password}) async {
    await _register(email: email, password: password);
  }
}
