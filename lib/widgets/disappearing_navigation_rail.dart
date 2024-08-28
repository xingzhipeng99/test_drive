import 'package:flutter/material.dart';
import 'package:test_drive/animations/animation.dart';
import 'package:test_drive/animations/nav_rail_transition.dart';

import '../models/chat_data.dart';
import 'animated_floating_action_button.dart';

class DisappearingNavigationRail extends StatelessWidget {
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation;

  const DisappearingNavigationRail({
    super.key,
    required this.backgroundColor,
    required this.selectedIndex,
    required this.railAnimation,
    required this.railFabAnimation,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        groupAlignment: -0.85,
        leading: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            const SizedBox(
              height: 8,
            ),
            AnimatedFloatingActionButton(
              animation: railFabAnimation,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            // FloatingActionButton(
            //   heroTag: UniqueKey(),
            //   onPressed: () {},
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(15),
            //     ),
            //   ),
            //   backgroundColor: colorScheme.tertiaryContainer,
            //   foregroundColor: colorScheme.onTertiaryContainer,
            //   child: const Icon(Icons.add),
            // ),
          ],
        ),
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
