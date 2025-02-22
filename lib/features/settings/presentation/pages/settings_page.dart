import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
              child: Text('설정', style: textTheme.titleLarge),
            ),
            ListTile(
              title: const Text('테마 설정'),
              trailing: DropdownButton<ThemeMode>(
                value: themeProvider.themeMode,
                onChanged: (ThemeMode? mode) {
                  if (mode != null) themeProvider.setThemeMode(mode);
                },
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('시스템'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('라이트'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('다크'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 