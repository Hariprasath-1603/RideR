import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/headers/login_header.dart';
import '../../widgets/headers/otp_header.dart';
import '../../widgets/cards/otp_card.dart';
import '../home/home_screen.dart';

/// OTP Verification Screen for phone authentication
class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String _otp = '';
  bool _isVerifyEnabled = false;
  static const int _otpLength = 4;

  void _handleOTPChanged(String otp) {
    setState(() {
      _otp = otp;
      _isVerifyEnabled = otp.length == _otpLength;
    });
  }

  void _handleVerify() {
    if (_isVerifyEnabled) {
      // Simulate OTP verification success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            phoneNumber: widget.phoneNumber,
          ),
        ),
      );
    }
  }

  void _handleResend() {
    // Handle resend OTP
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('OTP resent successfully'),
        backgroundColor: AppColors.darkEspresso,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                
                // App Logo (reused from login)
                const LoginHeader(),
                
                const SizedBox(height: 48),
                
                // OTP Header
                const OTPHeader(),
                
                const SizedBox(height: 40),
                
                // OTP Card with inputs and buttons
                OTPCard(
                  otpLength: _otpLength,
                  isVerifyEnabled: _isVerifyEnabled,
                  onVerify: _handleVerify,
                  onResend: _handleResend,
                  onOTPChanged: _handleOTPChanged,
                  phoneNumber: widget.phoneNumber,
                ),
                
                const SizedBox(height: 32),
                
                // Back to login option
                _buildBackToLogin(),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackToLogin() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Back to Login',
          style: TextStyle(
            color: AppColors.coffeeBrown.withOpacity(0.8),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
