import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/premium/intro_screen.dart';

/// Entry point of the Rider application.
/// 
/// Initializes and runs the [RiderApp] widget.
void main() {
  runApp(const RiderApp());
}

/// Main Application Widget
/// 
/// Configures the root MaterialApp with:
/// - Custom theme based on [AppColors]
/// - SF Pro Display font family
/// - Material 3 design system
class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.premiumGold,
          primary: AppColors.premiumGold,
          background: AppColors.luxuryWhite,
        ),
        scaffoldBackgroundColor: AppColors.luxuryWhite,
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      // Choose starting screen: PremiumIntroScreen or LoginScreen
      home: const PremiumIntroScreen(),
    );
  }
}
