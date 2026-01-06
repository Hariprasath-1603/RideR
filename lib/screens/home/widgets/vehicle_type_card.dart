import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// Vehicle Type Selection Card
/// 
/// Displays vehicle information including:
/// - Vehicle type and icon
/// - Price estimate
/// - ETA
/// - Passenger capacity
class VehicleTypeCard extends StatelessWidget {
  final String type;
  final IconData icon;
  final String price;
  final String eta;
  final String capacity;
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleTypeCard({
    super.key,
    required this.type,
    required this.icon,
    required this.price,
    required this.eta,
    required this.capacity,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 130,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen.withOpacity(0.1) : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryGreen : AppColors.almostBlack,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.pureWhite,
                size: 24,
              ),
            ),

            // Vehicle Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.primaryGreen : AppColors.almostBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 12,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      capacity,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Price and ETA
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.primaryGreen : AppColors.almostBlack,
                  ),
                ),
                Text(
                  eta,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
