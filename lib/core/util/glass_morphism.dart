import 'dart:ui';

import 'package:flutter/material.dart';

/*   Glass Morphism Widget   */
class GlassMorphism extends StatelessWidget {
  final Widget child;
  const GlassMorphism({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(),
        ),
        // gradient effect
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2),
              ],
            ),
          ),
        ),
        /* child widget will have the same glass effect*/
        child,
      ],
    );
  }
}
