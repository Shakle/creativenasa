import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated()) {
    signInAnonymously();
  }

  void signInAnonymously() {
    emit(Authenticating());

    try {
      // To let you see the login screen, login is too fast
      Future.delayed(const Duration(seconds: 2), () async {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInAnonymously();

        if (userCredential.user != null) {
          emit(Authenticated());
        } else {
          throw Exception('Could not sign in');
        }
      });
    } catch (e) {
      emit(AuthenticationFailed(exception: e));
      emit(Unauthenticated());
    }
  }
}
