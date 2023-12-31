import 'package:creativenasa/view/blocs/auth/auth_cubit.dart';
import 'package:creativenasa/view/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcessDescription extends StatelessWidget {
  const ProcessDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (pState, state) => state is AuthenticationFailed,
        listener: (context, state) {
          if (state is AuthenticationFailed) {
            showErrorSnackBar(context, state.exception.toString());
          }
        },
        builder: (context, state) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: state is Authenticated ? 0 : 1,
            child: Text(
              getDescriptionText(state),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                 color: switch (state) {
                   AuthenticationFailed()
                      => Theme.of(context).colorScheme.primary,
                   _ => null,
                 }
              ),
            ),
          );
        }
    );
  }

  String getDescriptionText(AuthState state) {
    return switch (state) {
      Authenticating() => 'Anonymous firebase login is in progress',
      Unauthenticated() => 'Login will automatically start shortly',
      _ => '',
    };
  }
}
