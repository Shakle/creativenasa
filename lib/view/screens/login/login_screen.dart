import 'package:creativenasa/view/screens/login/widgets/process_description.dart';
import 'package:creativenasa/view/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Expanded(child: Center(child: title(context))),
          const Expanded(child: Center(child: CircularProgressIndicator())),
          const Expanded(child: Align(
            alignment: Alignment(0, 0.7),
            child: ProcessDescription(),
          )),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return Text(
      'Let\'s login',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

}
