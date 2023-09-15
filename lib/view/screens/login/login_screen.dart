import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: title(context))),
            Expanded(child: Center(child: loginLoader())),
            Expanded(child: Align(
                alignment: const Alignment(0, 0.7),
                child: processDescription(),
            )),
          ],
        ),
      ),
    );
  }

  Widget title(BuildContext context) {
    return Text(
      'Let\'s login',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget loginLoader() {
    return const CircularProgressIndicator();
  }

  Widget processDescription() {
    return const Text('Anonymous firebase login is in progress');
  }
}
