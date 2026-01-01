import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Resend OTP Button with countdown timer
class ResendOTPButton extends StatefulWidget {
  final VoidCallback onResend;
  final int countdownSeconds;

  const ResendOTPButton({
    super.key,
    required this.onResend,
    this.countdownSeconds = 30,
  });

  @override
  State<ResendOTPButton> createState() => _ResendOTPButtonState();
}

class _ResendOTPButtonState extends State<ResendOTPButton> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    setState(() {
      _remainingSeconds = widget.countdownSeconds;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _handleResend() {
    if (_canResend) {
      widget.onResend();
      _startCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: _canResend ? _handleResend : null,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Text(
          _canResend
              ? 'Resend OTP'
              : 'Resend in ${_remainingSeconds}s',
          style: TextStyle(
            color: _canResend
                ? AppColors.darkEspresso
                : AppColors.coffeeBrown.withOpacity(0.5),
            fontSize: 15,
            fontWeight: _canResend ? FontWeight.w600 : FontWeight.w500,
            decoration: _canResend ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
