import 'package:flutter/material.dart';

class TransactionIconWidget extends StatelessWidget {
  const TransactionIconWidget(
      {super.key, required this.iconColor, required this.icon, this.rotation});

  final Color iconColor;
  final IconData icon;
  final double? rotation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Transform.rotate(
          angle: rotation ?? 0,
          child: Icon(
            icon,
            size: 16,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
