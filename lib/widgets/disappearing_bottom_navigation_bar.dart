import 'package:flutter/material.dart';
import 'package:test_drive/animations/animation.dart';
import 'package:test_drive/animations/bottom_bar_transition.dart';

import '../models/chat_data.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final BarAnimation barAnimation;

  const DisappearingBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.barAnimation,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: Colors.white,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedIndex: selectedIndex,
        destinations: destinations.map<NavigationDestination>(
          (d) {
            return NavigationDestination(
              icon: Icon(d.icon),
              label: d.label,
            );
          },
        ).toList(),
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
