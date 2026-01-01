import 'package:flutter/material.dart';
import '../buttons/social_login_button.dart';

/// Social Login Section with OAuth buttons
class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SocialLoginButton(
            icon: Icons.g_mobiledata_rounded,
            label: 'Google',
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: SocialLoginButton(
            icon: Icons.apple,
            label: 'Apple',
          ),
        ),
      ],
    );
  }
}
