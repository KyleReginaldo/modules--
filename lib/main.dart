import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msg/firebase_options.dart';
import 'package:msg/modules/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:msg/modules/auth/presentation/screen/auth_manager.dart';
import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modules',
      home: BlocProvider<AuthCubit>(
        create: (context) => sl<AuthCubit>()..userCheck(),
        child: const AuthManager(),
      ),
    );
  }
}
