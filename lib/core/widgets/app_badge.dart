import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum AppBadgeType {
  primary,
  secondary,
  success,
  error,
  neutral
}

class AppBadge extends StatelessWidget {
  final String text;
  final AppBadgeType type;
  final bool isSmall;

  const AppBadge({
    super.key,
    required this.text,
    this.type = AppBadgeType.primary,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(isSmall ? 4 : 6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: isSmall ? 12 : 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case AppBadgeType.primary:
        return AppColors.primary500.withOpacity(0.1);
      case AppBadgeType.secondary:
        return AppColors.secondary500.withOpacity(0.1);
      case AppBadgeType.success:
        return AppColors.success.withOpacity(0.1);
      case AppBadgeType.error:
        return AppColors.error.withOpacity(0.1);
      case AppBadgeType.neutral:
        return AppColors.neutral500.withOpacity(0.1);
    }
  }

  Color _getTextColor() {
    switch (type) {
      case AppBadgeType.primary:
        return AppColors.primary500;
      case AppBadgeType.secondary:
        return AppColors.secondary500;
      case AppBadgeType.success:
        return AppColors.success;
      case AppBadgeType.error:
        return AppColors.error;
      case AppBadgeType.neutral:
        return AppColors.neutral500;
    }
  }
} 