import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name}}/all.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class App extends StatefulWidget {
  final StatefulNavigationShell shell;

  const App({super.key, required this.shell});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.shell,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: BottomNavBar(
        shell: widget.shell,
        resetStack: resetStack,
      ),
    );
  }

  resetStack(int tabIdx) {
    final shell = widget.shell;
    shell.goBranch(
      tabIdx,
      initialLocation: tabIdx == shell.currentIndex,
    );
  }
}
