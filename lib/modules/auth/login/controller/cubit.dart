// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/modules/auth/login/controller/states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginFailure("Please fill all fields"));
      return;
    }

    try {
      emit(LoginLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(_handleFirebaseAuthException(e)));
    } catch (e) {
      emit(const LoginFailure("An unexpected error occurred. Please try again."));
    }
  }

  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginFailure("Please fill all fields"));
      return;
    }

    try {
      emit(LoginLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(_handleFirebaseAuthException(e)));
    } catch (e) {
      emit(const LoginFailure("An unexpected error occurred. Please try again."));
    }
  }

  String _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An authentication error occurred. Please try again.';
    }
  }
}
