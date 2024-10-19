import 'package:flutter/material.dart';
import 'package:flutter_curve_animation/const.dart';
import 'package:flutter_curve_animation/curve_animation_preview.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  final itemSize = 250;

  @override
  Widget build(BuildContext context) {
    //screen size
    final size = MediaQuery.of(context).size;
    debugPrint('xyz, build: size: $size');
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Flutter all Curves',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (size.width / itemSize).toInt(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 5 / 5,
              ),
              itemCount: curves.length,
              itemBuilder: (context, index) {
                return CurveAnimationPreview(curve: curves[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
