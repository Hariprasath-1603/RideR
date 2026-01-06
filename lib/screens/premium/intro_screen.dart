import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'vehicle_selection_screen.dart';

/// Premium Intro Screen
/// 
/// Features:
/// - Full-screen luxury car image
/// - Dark gradient overlay
/// - Bold headline "Anytime, anywhere"
/// - Rounded "Get Started" button
class PremiumIntroScreen extends StatelessWidget {
  const PremiumIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen luxury car background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/luxury_car.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback gradient background if image not found
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF1A1A1A),
                        Color(0xFF0A0A0A),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 120,
                      color: AppColors.premiumGold,
                    ),
                  ),
                );
              },
            ),
          ),

          // Dark gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradientStart.withOpacity(0.3),
                    AppColors.gradientStart.withOpacity(0.7),
                    AppColors.gradientStart.withOpacity(0.95),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Premium badge or logo
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.softGray.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.premiumGold.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'PREMIUM',
                      style: TextStyle(
                        color: AppColors.premiumGold,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),

                  // Main headline
                  const Text(
                    'Anytime,\nanywhere',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.luxuryWhite,
                      height: 1.1,
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Subtitle
                  Text(
                    'Book luxury vehicles at your fingertips.\nExperience premium rides.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.lightGray.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehicleSelectionScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.premiumGold,
                        foregroundColor: AppColors.premiumBlack,
                        elevation: 8,
                        shadowColor: AppColors.premiumGold.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Bottom indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(true),
                      const SizedBox(width: 8),
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(false),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.premiumGold : AppColors.midGray,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
