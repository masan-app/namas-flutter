import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  final String title;

  const AppHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.neutral900,
        ),
      ),
    );
  }
} 