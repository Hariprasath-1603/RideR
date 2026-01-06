import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// Pickup Location Indicator Widget
/// 
/// Shows current GPS location with a green dot indicator
class PickupLocationIndicator extends StatelessWidget {
  final String address;
  final VoidCallback onTap;

  const PickupLocationIndicator({
    super.key,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Green Dot Indicator
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryGreen.withOpacity(0.3),
                  width: 3,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Location Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pickup Location',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.almostBlack,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Edit Icon
            const Icon(
              Icons.edit_location_alt,
              color: AppColors.mediumGrey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
