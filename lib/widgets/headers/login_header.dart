import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// App Logo Header Component
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.darkEspresso,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkEspresso.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.directions_car_rounded,
          color: AppColors.lightLatte,
          size: 40,
        ),
      ),
    );
  }
}
