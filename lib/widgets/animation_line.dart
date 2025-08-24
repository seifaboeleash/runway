import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationLine extends StatefulWidget {
  @override
  _AnimationLineState createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        // لو الأنيميشن خلص، رجّع الصورة عادي
        if (_controller.isCompleted) {
          return SvgPicture.asset(
            'assets/logo/line.svg',
            fit: BoxFit.contain,
          );
        }

        // طول ما الأنيميشن شغال
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.black,
                Colors.black,
              ],
              stops: [
                (_controller.value - 0.2).clamp(0.0, 1.0),
                _controller.value.clamp(0.0, 1.0),
                (_controller.value + 0.2).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SvgPicture.asset(
            'assets/logo/Rectangle 9.svg',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
