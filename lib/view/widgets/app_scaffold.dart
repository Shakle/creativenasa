import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.appBar,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    super.key,
  });

  final Widget body;
  final AppBar? appBar;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Padding(
            padding: padding,
            child: body,
          ),
      ),
    );
  }
}
