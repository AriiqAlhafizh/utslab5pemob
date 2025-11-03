import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utslab5pemob/Widgets/custom_navbar.dart';


class CustomShell extends StatefulWidget {
  final Widget child; // Widget yang berubah (HomeScreen atau ProfileScreen)

  const CustomShell({super.key, required this.child});

  @override
  State<CustomShell> createState() => _CustomShellState();
}

class _CustomShellState extends State<CustomShell> {
  int _getTabIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/profile')) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    final int currentIndex = _getTabIndex(location);

    return Scaffold(
      body: Stack(
        children: [
          widget.child,

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavbar(currentIndex: currentIndex),
          ),
        ],
      ),
    );
  }
}