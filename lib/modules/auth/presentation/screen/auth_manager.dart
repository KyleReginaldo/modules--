import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg/modules/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:msg/modules/auth/presentation/screen/login_screen.dart';
import 'package:msg/presentation/screen/home_screen.dart';

import 'authenticating.dart';

class AuthManager extends StatelessWidget {
  const AuthManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        } else if (state is Authenticating) {
          return const AuthenticatingScreen();
        } else if (state is UnAuthenticated) {
          return const LoginScreen();
        }
        return Container();
      },
    );
  }
}
