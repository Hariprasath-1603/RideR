import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Primary Action Button Component
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkEspresso,
          foregroundColor: Colors.white,
          elevation: enabled ? 0 : 0,
          disabledBackgroundColor: AppColors.darkEspresso,
          disabledForegroundColor: Colors.white,
          shadowColor: AppColors.darkEspresso.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
