import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  // SystemChrome을 위해 추가
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_colors.dart';
import 'core/providers/theme_provider.dart';
import 'core/widgets/app_bottom_navigation.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/community/presentation/pages/community_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(prefs),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
    // 테마에 따라 상태바 스타일 변경
    SystemChrome.setSystemUIOverlayStyle(
      themeProvider.themeMode == ThemeMode.dark
          ? SystemUiOverlayStyle.light  // 다크모드: 흰색 아이콘
          : SystemUiOverlayStyle.dark    // 라이트모드: 검은색 아이콘
    );
    
    return MaterialApp(
      title: '휘트니스',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary500,
          secondary: AppColors.secondary500,
          surface: AppColors.lightSurface,
          background: AppColors.lightBackground,
          error: AppColors.error,
          onSurface: AppColors.neutral900,
          onBackground: AppColors.neutral900,
        ),
        scaffoldBackgroundColor: AppColors.lightBackground,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: AppColors.primary500.withOpacity(0.1),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: AppColors.primary500);
            }
            return null;
          }),
        ),
        textTheme: Typography.material2021().black.copyWith(
          titleLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral900,
          ),
          titleMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral900,
          ),
          bodyLarge: const TextStyle(color: AppColors.neutral900),
          bodyMedium: const TextStyle(color: AppColors.neutral900),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary500,
          secondary: AppColors.secondary500,
          surface: AppColors.darkSurface,
          background: AppColors.darkBackground,
          error: AppColors.error,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: AppColors.primary500.withOpacity(0.1),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: AppColors.primary500);
            }
            return null;
          }),
        ),
        textTheme: Typography.material2021().white.copyWith(
          titleLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
          titleMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
          bodyLarge: const TextStyle(color: AppColors.darkText),
          bodyMedium: const TextStyle(color: AppColors.darkText),
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CommunityPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
