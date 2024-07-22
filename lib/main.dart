import 'package:connection_notifier/connection_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app_nav/controller/cubit.dart';
import 'package:test_project/app_nav/ui/nav_menu_screen.dart';
import 'package:test_project/bloc_observer.dart';
import 'package:test_project/modules/auth/login/controller/cubit.dart';
import 'package:test_project/modules/auth/login/ui/login/login_screen.dart';
import 'package:test_project/modules/home/controller/cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => NavMenuCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child:  ConnectionNotifier(
        child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()),
      ),
    );
  }
}
