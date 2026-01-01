import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../inputs/phone_input_field.dart';
import '../buttons/primary_button.dart';

/// Main Login Card with Phone Input and Continue Button
class LoginCard extends StatelessWidget {
  final TextEditingController phoneController;
  final VoidCallback onContinue;

  const LoginCard({
    super.key,
    required this.phoneController,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightLatte,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.coffeeBrown.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PhoneInputField(controller: phoneController),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Continue',
              onPressed: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
