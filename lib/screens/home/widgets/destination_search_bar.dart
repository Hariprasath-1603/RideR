import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// Destination Search Bar Widget
/// 
/// Prominent "Where to?" search bar for destination input
class DestinationSearchBar extends StatelessWidget {
  final VoidCallback onTap;

  const DestinationSearchBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Search Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.search,
                color: AppColors.almostBlack,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            
            // "Where to?" Text
            const Expanded(
              child: Text(
                'Where to?',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Forward Arrow
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mediumGrey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
