import 'package:flutter/cupertino.dart';
import 'package:test_drive/animations/animation.dart';

class BottomBarTransition extends StatefulWidget {
  final Animation<double> animation;
  final Color backgroundColor;
  final Widget child;

  const BottomBarTransition({
    super.key,
    required this.animation,
    required this.backgroundColor,
    required this.child,
  });

  @override
  State<BottomBarTransition> createState() => _BottomBarTransitionState();
}

class _BottomBarTransitionState extends State<BottomBarTransition> {
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));

  late final Animation<double> heightAnimation = Tween<double>(begin: 0, end: 1)
      .animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: heightAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
