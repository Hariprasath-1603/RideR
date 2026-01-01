import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/headers/login_header.dart';
import '../../widgets/headers/welcome_section.dart';
import '../../widgets/cards/login_card.dart';
import '../../widgets/dividers/social_login_divider.dart';
import '../../widgets/social_login/social_login_section.dart';
import '../../widgets/footers/terms_and_privacy.dart';
import '../otp_verification/otp_verification_screen.dart';

/// Login Screen - Main authentication screen for phone number login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handlePhoneLogin() {
    if (_formKey.currentState!.validate()) {
      final phoneNumber = _phoneController.text;
      
      // Navigate to OTP verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            phoneNumber: '+1 $phoneNumber',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  const LoginHeader(),
                  const SizedBox(height: 48),
                  const WelcomeSection(),
                  const SizedBox(height: 40),
                  LoginCard(
                    phoneController: _phoneController,
                    onContinue: _handlePhoneLogin,
                  ),
                  const SizedBox(height: 32),
                  const SocialLoginDivider(),
                  const SizedBox(height: 32),
                  const SocialLoginSection(),
                  const SizedBox(height: 24),
                  const TermsAndPrivacy(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
