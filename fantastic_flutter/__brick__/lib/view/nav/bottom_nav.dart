import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  final Function resetStack;
  final StatefulNavigationShell shell;

  const BottomNavBar({
    super.key,
    required this.shell,
    required this.resetStack,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.shell.currentIndex,
      onDestinationSelected: (idx) => _goBranch(idx, context),
      destinations: [
        _buildNav('Home', Icons.home),
        _buildNav('Design Guide', Icons.candlestick_chart),
        _buildNav('Funds', Icons.play_arrow),
        _buildNav('Investors', Icons.notifications),
        _buildNav('Profile', Icons.person),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  NavigationDestination _buildNav(text, IconData icon) {
    return NavigationDestination(
      label: text,
      icon: Icon(
        icon,
      ),
    );
  }

  void _goBranch(int index, context) {
    widget.resetStack(index);
    Future.delayed(const Duration(milliseconds: 25), () {});
  }
}
