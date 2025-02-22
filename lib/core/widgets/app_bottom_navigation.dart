import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: colorScheme.surface,
      elevation: 8,
      shadowColor: Colors.black12,
      height: 56,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: isDark 
          ? colorScheme.primary.withOpacity(0.3)  // 다크모드에서 더 선명하게
          : colorScheme.primary.withOpacity(0.1),
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.dashboard_outlined,
            color: isDark ? Colors.white70 : null,
          ),
          selectedIcon: Icon(
            Icons.dashboard,
            color: isDark ? Colors.white : colorScheme.primary,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.chat_bubble_outline_rounded,
            color: isDark ? Colors.white70 : null,
          ),
          selectedIcon: Icon(
            Icons.chat_bubble_rounded,
            color: isDark ? Colors.white : colorScheme.primary,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.tune_rounded,
            color: isDark ? Colors.white70 : null,
          ),
          selectedIcon: Icon(
            Icons.tune_rounded,
            color: isDark ? Colors.white : colorScheme.primary,
          ),
          label: '',
        ),
      ],
    );
  }
} 