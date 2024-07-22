import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app_nav/controller/state.dart';
import 'package:test_project/modules/cart/ui/cart_screen.dart';
import 'package:test_project/modules/home/ui/home_screen.dart';

class NavMenuCubit extends Cubit<NavMenuState> {
  NavMenuCubit() : super(NavMenuInitial());

  final List<Widget> screens = [const HomeScreen(), const CartScreen(),];

  void changeScreen(int index) {
    emit(NavMenuChange(index, screens[index]));
  }
}
