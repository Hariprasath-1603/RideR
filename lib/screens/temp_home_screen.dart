import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Temporary Home Screen
class TempHomeScreen extends StatelessWidget {
  const TempHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamGrey,
      appBar: AppBar(
        title: const Text('RideR'),
        backgroundColor: AppColors.darkEspresso,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car,
              size: 100,
              color: AppColors.darkEspresso,
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome to RideR',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Temporary Home Page',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
