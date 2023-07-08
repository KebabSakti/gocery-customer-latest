import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.radius = 10,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        period: const Duration(
          milliseconds: 700,
        ),
        baseColor: theme.colorScheme.background,
        highlightColor: theme.colorScheme.surface,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
