import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const RiderApp());
}

/// Main Application Widget
class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkEspresso,
          primary: AppColors.darkEspresso,
        ),
        scaffoldBackgroundColor: AppColors.creamGrey,
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
