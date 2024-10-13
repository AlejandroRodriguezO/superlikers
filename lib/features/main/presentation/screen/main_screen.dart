import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'widgets/custom_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: child,
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
        currentIndex: child.currentIndex,
        selectedItemColor: Colors.orange,
        onTap: (int i) => child.goBranch(
          i,
          initialLocation: i == child.currentIndex,
        ),
      ),
    );
  }
}
