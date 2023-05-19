import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClickableIcon extends StatelessWidget {
  final String iconPath;
  final Color? color;
  final double? height;
  final VoidCallback? onPressed;
  const ClickableIcon({
    Key? key,
    required this.iconPath,
    this.onPressed,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: SvgPicture.asset(
          iconPath,
          height: height,
          fit: BoxFit.scaleDown,
          colorFilter:
              ColorFilter.mode(color ?? Colors.transparent, BlendMode.color),
        ),
      ),
    );
  }
}
