import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Welcome Text Section Component
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Rider',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.darkEspresso,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your phone number to continue',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.coffeeBrown,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
