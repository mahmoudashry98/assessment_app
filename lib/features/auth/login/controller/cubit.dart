import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/features/auth/login/controller/states.dart';

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
    } catch (e) {
      emit(LoginFailure(e.toString()));
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
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
