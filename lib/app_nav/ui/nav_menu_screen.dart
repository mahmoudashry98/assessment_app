import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app_nav/controller/cubit.dart';
import 'package:test_project/app_nav/controller/state.dart';
import 'package:test_project/core/utils/app_color.dart';

class NavMenuScreen extends StatelessWidget {
  const NavMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavMenuCubit(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<NavMenuCubit, NavMenuState>(
          builder: (context, state) {
            return ConnectionNotifierToggler(
              onConnectionStatusChanged: (connected) {},
              connected: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff353f54), Color(0xfff222834)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: NavigationBar(
                  backgroundColor: Colors.transparent,
                  indicatorColor: AppColors.whiteColor.withOpacity(0.1),
                  height: 80,
                  elevation: 0,
                  selectedIndex: state.selectedIndex,
                  onDestinationSelected: (index) => context.read<NavMenuCubit>().changeScreen(index),
                  destinations: [
                    CustomNavigationDestination(
                      iconPath: 'assets/icons/bicycle.png',
                      isSelected: state.selectedIndex == 0,
                      onTap: () => context.read<NavMenuCubit>().changeScreen(0),
                    ),
                    CustomNavigationDestination(
                      iconPath: 'assets/icons/map.fill.png',
                      isSelected: state.selectedIndex == 1,
                      onTap: () => context.read<NavMenuCubit>().changeScreen(1),
                    ),
                    CustomNavigationDestination(
                      iconPath: 'assets/icons/cart.fill.png',
                      isSelected: state.selectedIndex == 2,
                      onTap: () => context.read<NavMenuCubit>().changeScreen(2),
                    ),
                    CustomNavigationDestination(
                      iconPath: 'assets/icons/person.fill.png',
                      isSelected: state.selectedIndex == 3,
                      onTap: () => context.read<NavMenuCubit>().changeScreen(3),
                    ),
                    CustomNavigationDestination(
                      iconPath: 'assets/icons/doc.text.fill.png',
                      isSelected: state.selectedIndex == 4,
                      onTap: () => context.read<NavMenuCubit>().changeScreen(4),
                    ),
                  ],
                ),
              ),
              disconnected: const Center(
                child: CircularProgressIndicator(
                  
                ),
              ),
            );
          },
        ),
        body: BlocBuilder<NavMenuCubit, NavMenuState>(
          builder: (context, state) {
            return state.selectedScreen;
          },
        ),
      ),
    );
  }
}



// Custom NavigationDestination widget
class CustomNavigationDestination extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavigationDestination({
    Key? key,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF34CAE8), Color(0xFF4E49F2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}
