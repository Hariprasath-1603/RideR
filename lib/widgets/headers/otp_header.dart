import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// OTP Verification Header with title and subtitle
class OTPHeader extends StatelessWidget {
  const OTPHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verify your phone number',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.darkEspresso,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Enter the 4-digit code sent to your number',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.coffeeBrown,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
