import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    permissions();
  }

  Future<void> permissions() async {
    await Permission.notification.isDenied.then((bool value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Bonificación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Resumen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Autoejecución',
          ),
        ],
        currentIndex: widget.child.currentIndex,
        selectedItemColor: Colors.orange,
        onTap: (int i) => widget.child.goBranch(
          i,
          initialLocation: i == widget.child.currentIndex,
        ),
      ),
    );
  }
}
