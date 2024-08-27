import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StartButton> {
  bool state = false;
  late final ColorScheme _colorTheme = Theme.of(context).colorScheme;

  Icon get icon {
    final IconData iconData = state ? Icons.star : Icons.star_outline;
    return Icon(
      iconData,
      color: Colors.grey,
      size: 20,
    );
  }

  void _toggle() {
    setState(() {
      state = !state;
    });
  }

  double get turns => state ? 1 : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(microseconds: 30),
      curve: Curves.decelerate,
      child: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: _colorTheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: icon,
        ),
        onPressed: () => _toggle(),
      ),
    );
  }
}
