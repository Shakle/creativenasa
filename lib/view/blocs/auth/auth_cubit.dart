import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated()) {
    // Starts auth subscription to check auth states
    _authStreamSub = getAuthSubscription();
  }

  late final StreamSubscription<User?> _authStreamSub;

  // Auth state subscription to check state and make changes
  StreamSubscription<User?> getAuthSubscription() {
    return FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // Delay is to let you see the login screen, login is too fast
        Future.delayed(const Duration(seconds: 2), () {
          emit(Authenticated());
        });
      } else {
        emit(Unauthenticated());
        signInAnonymously();
      }
    });
  }

  // Signs user out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Automatically authenticates
  Future<void> signInAnonymously() async {
    emit(Authenticating());

    try {
      await FirebaseAuth.instance.signInAnonymously()
          .timeout(const Duration(seconds: 10),
          onTimeout: () => throw TimeoutException('Login takes too much time'),
      );
    } catch (e) {
      emit(AuthenticationFailed(exception: e));
      emit(Unauthenticated());
      Future.delayed(const Duration(seconds: 3), () {
        signInAnonymously(); // auto-retry for login
      });
    }
  }

  // closes auth subscription (should never happen)
  @override
  Future<void> close() {
    _authStreamSub.cancel();
    return super.close();
  }
}
