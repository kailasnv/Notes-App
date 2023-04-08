import 'package:flutter/material.dart';
import 'package:notes/core/const_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          color: kShowFormItemsColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
