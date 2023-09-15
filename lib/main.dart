import 'package:creativenasa/app.dart';
import 'package:creativenasa/firebase_options.dart';
import 'package:creativenasa/view/blocs/auth/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');

  runApp(BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(),
    child: const App(),
  ));
}
