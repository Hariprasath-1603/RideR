import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Premium Button Widget
/// 
/// Reusable button with premium gold styling
class PremiumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final double height;
  final bool isFullWidth;

  const PremiumButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.height = 56,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? Colors.transparent
              : AppColors.premiumGold,
          foregroundColor: isOutlined
              ? AppColors.premiumGold
              : AppColors.premiumBlack,
          elevation: isOutlined ? 0 : 4,
          shadowColor: AppColors.premiumGold.withOpacity(0.4),
          side: isOutlined
              ? const BorderSide(
                  color: AppColors.premiumGold,
                  width: 2,
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

/// Premium Icon Button Widget
/// 
/// Circular icon button with shadow
class PremiumIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  const PremiumIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.cardWhite,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: size * 0.45,
          color: iconColor ?? AppColors.premiumBlack,
        ),
      ),
    );
  }
}

/// Premium Card Widget
/// 
/// Elevated card with rounded corners and shadow
class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double borderRadius;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? AppColors.cardWhite,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Premium Badge Widget
/// 
/// Small label badge with border
class PremiumBadge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const PremiumBadge({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.premiumGold.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 1,
              )
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor ?? AppColors.premiumGold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Premium Rating Widget
/// 
/// Star rating display
class PremiumRating extends StatelessWidget {
  final String rating;
  final int starSize;

  const PremiumRating({
    super.key,
    required this.rating,
    this.starSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: starSize.toDouble(),
          color: AppColors.premiumGold,
        ),
        const SizedBox(width: 4),
        Text(
          rating,
          style: TextStyle(
            fontSize: starSize - 2,
            fontWeight: FontWeight.bold,
            color: AppColors.premiumBlack,
          ),
        ),
      ],
    );
  }
}

/// Premium Divider Widget
/// 
/// Vertical divider for separating content
class PremiumDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;

  const PremiumDivider({
    super.key,
    this.height = 60,
    this.width = 1,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color ?? AppColors.midGray.withOpacity(0.2),
    );
  }
}

/// Drag Handle Widget
/// 
/// Handle for bottom sheets
class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.midGray.withOpacity(0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
