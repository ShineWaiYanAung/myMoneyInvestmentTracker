import 'package:flutter/material.dart';

class TabBarItem extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isOnTap;
  final String label;
  const TabBarItem({
    required this.label,
    required this.onPressed,
    required this.isOnTap,
    super.key,
  });

  @override
  State<TabBarItem> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;

  @override
  void initState() {
    super.initState();
    // Increase duration to 16 seconds for a slower animation
    _controller =
        AnimationController(duration: Duration(seconds: 8), vsync: this);

    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: widget.isOnTap
                  ? LinearGradient(
                      begin: _tlAlignAnim.value,
                      end: _brAlignAnim.value,
                      colors: [
                          Colors.white,
                          Theme.of(context).scaffoldBackgroundColor
                        ])
                  : null,
              borderRadius: BorderRadius.circular(60),
            ),
            padding: EdgeInsets.all(4),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xff151932),
                ),
                width: double.infinity,
                height: double.infinity,
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.label,
                    style: TextStyle(color: Colors.white, fontSize: 35),
                    textAlign: TextAlign.center, // Center text in the Container
                  ),
                )),
          );
        },
      ),
    );
  }
}
