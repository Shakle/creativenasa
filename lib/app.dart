import 'package:creativenasa/data/api/nasa/nasa_credentials.dart';
import 'package:creativenasa/router/router.dart';
import 'package:creativenasa/view/blocs/auth/auth_cubit.dart';
import 'package:creativenasa/view/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late final GoRouter router;

  @override
  void initState() {
    router = AppRouter().router(context.read<AuthCubit>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(NasaCredentials.apiKey);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp.router(
        title: 'Creativenasa',
        theme: AppTheme.lightMainTheme,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
