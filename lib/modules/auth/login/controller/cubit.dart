import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/modules/auth/login/controller/states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(AuthFailure("Please fill all fields"));
      return;
    }

    try {
      emit(AuthLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(AuthFailure("No account found for this email address"));
          break;
        case 'wrong-password':
          emit(AuthFailure("Incorrect password provided"));
          break;
        case 'invalid-email':
          emit(AuthFailure("The email address is not valid."));
          break;
        case 'user-disabled':
          emit(AuthFailure("This user has been disabled."));
          break;
        default:
          emit(AuthFailure(_handleFirebaseAuthException(e)));
          break;
      }
    } catch (e) {
      emit(AuthFailure("An unexpected error occurred. Please try again."));
    }
  }

  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(AuthFailure("Please fill all fields"));
      return;
    }

    try {
      emit(AuthLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(AuthFailure("This email address is already in use"));
          break;
        case 'invalid-email':
          emit(AuthFailure("The email address is not valid."));
          break;
        case 'weak-password':
          emit(AuthFailure("The password provided is too weak."));
          break;
        default:
          emit(AuthFailure(_handleFirebaseAuthException(e)));
          break;
      }
    } catch (e) {
      emit(AuthFailure("An unexpected error occurred. Please try again."));
    }
  }

  String _handleFirebaseAuthException(FirebaseAuthException e) {
    return e.message ?? "An unknown error occurred. Please try again.";
  }
}
