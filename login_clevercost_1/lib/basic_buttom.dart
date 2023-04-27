import 'package:flutter/material.dart';
import 'constants.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kBluePrimary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
