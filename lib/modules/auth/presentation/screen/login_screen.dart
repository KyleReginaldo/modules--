import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:msg/core/utils/helper_widgets.dart';
import 'package:msg/modules/auth/presentation/auth_cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              'Email',
              controller: emailController,
              radius: 4,
            ),
            addVerticalSpace(16),
            CustomTextField(
              'Password',
              controller: passwordController,
              radius: 4,
              obscureText: isObscure,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? const Iconify(Ph.eye_light)
                    : const Iconify(Ph.eye_closed_thin),
              ),
            ),
            addVerticalSpace(32),
            BtnFilled(
              onTap: () {
                context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              icon: const Iconify(Uiw.login),
              text: 'Login',
              width: double.infinity,
              radius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
