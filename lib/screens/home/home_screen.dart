import 'package:flutter/material.dart';
import 'booking_home_screen.dart';

/// Home Screen - Placeholder after successful authentication
class HomeScreen extends StatelessWidget {
  final String phoneNumber;

  const HomeScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    // Redirect to the new modern booking screen
    return BookingHomeScreen(phoneNumber: phoneNumber);
  }
}
