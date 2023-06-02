import 'package:flutter/material.dart';

import '../../common/config/const.dart';

class MButton extends StatelessWidget {
  const MButton({
    super.key,
    this.text,
    this.onPressed,
    this.textColor,
    this.textSize,
    this.size,
    this.radius,
    this.color,
    this.child,
  });

  final String? text;
  final void Function()? onPressed;
  final Color? textColor;
  final double? textSize;
  final double? size;
  final double? radius;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? theme.colorScheme.primary,
        minimumSize: Size.fromHeight(size ?? 45),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 50)),
        disabledBackgroundColor: Colors.grey[800],
      ).merge(
        ButtonStyle(elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0;
        })),
      ),
      child: child ??
          Text(
            text ?? '',
            style: TextStyle(
              color: textColor ?? theme.colorScheme.onPrimary,
              fontSize: textSize ?? medium,
            ),
          ),
    );
  }
}
