// Cubit States
import 'package:flutter/material.dart';
import 'package:test_project/modules/home/ui/home_screen.dart';

abstract class NavMenuState {
  final int selectedIndex;
  final Widget selectedScreen;

  NavMenuState(this.selectedIndex, this.selectedScreen);
}

class NavMenuInitial extends NavMenuState {
  NavMenuInitial() : super(0, const HomeScreen());
}

class NavMenuChange extends NavMenuState {
  NavMenuChange(int index, Widget screen) : super(index, screen);
}
