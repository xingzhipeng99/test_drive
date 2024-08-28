// https://codelabs.developers.google.com/codelabs/flutter-animated-responsive-layout?hl=zh-cn#3

import 'package:flutter/material.dart';
import 'package:test_drive/animations/animation.dart';
import 'package:test_drive/animations/list_detail_transition.dart';
import 'package:test_drive/widgets/animated_floating_action_button.dart';
import 'package:test_drive/widgets/disappearing_bottom_navigation_bar.dart';
import 'package:test_drive/widgets/disappearing_navigation_rail.dart';
import 'package:test_drive/widgets/email_list_view.dart';
import 'package:test_drive/widgets/reply_list_view.dart';

import '../models/chat_data.dart';
import '../models/chat_models.dart';
import '../widgets/search_bar.dart';

class FeedScreen extends StatefulWidget {
  final User currentUser;

  const FeedScreen({super.key, required this.currentUser});

  static const routeName = '/feed';

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final Color _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.4), _colorScheme.surface);

  late final _controller = AnimationController(
    vsync: this,
    value: 0,
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1250),
  );

  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  int selectedIndex = 0;

  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: _backgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: FeedSearchBar(
              currentUser: widget.currentUser,
            ),
          )),
      body: Row(
        children: [
          DisappearingNavigationRail(
            railAnimation: _railAnimation,
            railFabAnimation: _railFabAnimation,
            backgroundColor: _backgroundColor,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              child: ListDetailTransition(
                animation: _railAnimation,
                one: EmailListView(
                  currentUser: widget.currentUser,
                  selectedIndex: selectedIndex,
                  onSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                two: const ReplyListView(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        animation: _barAnimation,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: DisappearingBottomNavigationBar(
        selectedIndex: selectedIndex,
        barAnimation: _barAnimation,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      // floatingActionButton: wideScreen
      //     ? null
      //     : FloatingActionButton(
      //         heroTag: UniqueKey(),
      //         onPressed: () {},
      //         backgroundColor: _colorScheme.tertiaryContainer,
      //         foregroundColor: _colorScheme.onTertiaryContainer,
      //         child: const Icon(Icons.add),
      //       ),
      // bottomNavigationBar: wideScreen
      //     ? null
      //     : NavigationBar(
      //         elevation: 0,
      //         backgroundColor: Colors.white,
      //         selectedIndex: selectedIndex,
      //         destinations: destinations.map<NavigationDestination>((d) {
      //           return NavigationDestination(
      //             icon: Icon(d.icon),
      //             label: d.label,
      //           );
      //         }).toList(),
      //         onDestinationSelected: (index) {
      //           setState(() {
      //             selectedIndex = index;
      //           });
      //         },
      //       ),
    );
  }
}
