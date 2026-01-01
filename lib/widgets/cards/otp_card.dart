import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../inputs/otp_input_field.dart';
import '../buttons/primary_button.dart';
import '../buttons/resend_otp_button.dart';

/// OTP Verification Card with input fields and verify button
class OTPCard extends StatelessWidget {
  final int otpLength;
  final bool isVerifyEnabled;
  final VoidCallback onVerify;
  final VoidCallback onResend;
  final ValueChanged<String> onOTPChanged;
  final String phoneNumber;

  const OTPCard({
    super.key,
    required this.otpLength,
    required this.isVerifyEnabled,
    required this.onVerify,
    required this.onResend,
    required this.onOTPChanged,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightLatte,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.coffeeBrown.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Phone number display
            Center(
              child: Text(
                phoneNumber,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.coffeeBrown,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            
            const SizedBox(height: 28),
            
            // OTP Input Fields
            OTPInputField(
              length: otpLength,
              onCompleted: (otp) {
                onOTPChanged(otp);
              },
              onChanged: (otp) {
                onOTPChanged(otp);
              },
            ),
            
            const SizedBox(height: 32),
            
            // Verify Button
            PrimaryButton(
              label: 'Verify',
              onPressed: onVerify,
              enabled: isVerifyEnabled,
            ),
            
            const SizedBox(height: 20),
            
            // Resend OTP Button
            ResendOTPButton(
              onResend: onResend,
              countdownSeconds: 30,
            ),
          ],
        ),
      ),
    );
  }
}
