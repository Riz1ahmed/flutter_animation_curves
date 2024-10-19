import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_curve_animation/const.dart';

class CurveAnimationPreview extends StatefulWidget {
  const CurveAnimationPreview({
    super.key,
    required this.curve,
  });

  final Curve curve;

  @override
  CurveAnimationPreviewState createState() => CurveAnimationPreviewState();
}

class CurveAnimationPreviewState extends State<CurveAnimationPreview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double size = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Line graph of the curve
          Container(
            height: size * 4,
            width: size * 4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
            ),
            child: CustomPaint(
              painter: CurvePainter(widget.curve),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Rotation animation
              AnimatedBuilder(
                animation: _animation,
                child: Container(width: size, height: size, color: Colors.blue),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * 2 * 3.14159,
                    child: child,
                  );
                },
              ),

              const SizedBox(width: 12),
              // Translation animation
              AnimatedBuilder(
                animation: _animation,
                child:
                    Container(width: size, height: size, color: Colors.green),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value * -16),
                    child: child,
                  );
                },
              ),

              const SizedBox(width: 12),
              // Scaling animation
              AnimatedBuilder(
                animation: _animation,
                child: Container(width: size, height: size, color: Colors.red),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
              ),

              const SizedBox(width: 12),
              // Fading animation
              AnimatedBuilder(
                animation: _animation,
                child:
                    Container(width: size, height: size, color: Colors.purple),
                builder: (context, child) {
                  return Opacity(
                    opacity: max(0, min(1, _animation.value)),
                    child: child,
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 6),
          Text(widget.curve.name),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Curve curve;

  CurvePainter(this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;

    final path = Path();
    for (double t = 0.0; t <= 1.0; t += 0.01) {
      final x = t * size.width;
      final y = (1 - curve.transform(t)) * size.height;
      if (t == 0.0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
