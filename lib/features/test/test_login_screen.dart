import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSVGWidget extends StatefulWidget {
  @override
  _AnimatedSVGWidgetState createState() => _AnimatedSVGWidgetState();
}

class _AnimatedSVGWidgetState extends State<AnimatedSVGWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SvgPicture.asset(
            'assets/your_svg_file.svg',
            semanticsLabel: 'Animated SVG',
            width: 200,
            height: 200,
            placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator(),
            ),
            // Use the AnimatedDrawing class from flutter_svg
            // to animate the SVG path based on the stroke-dashoffset

            // builder: (BuildContext context, Widget? svgWidget) {
            //   return AnimatedDrawing.svg(
            //     svg: svgWidget!,
            //     duration: Duration(seconds: 2),
            //     animation: Tween<double>(begin: 0.0, end: 1.0)
            //         .animate(_controller),
            //   );
            // },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
