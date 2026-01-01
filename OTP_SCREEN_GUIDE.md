# OTP Verification Screen - Implementation Guide

## 📱 Screen Overview

The OTP Verification Screen is part of the phone-based authentication flow for the Rider ride-hailing application. It follows the user entering their phone number on the login screen.

## 🎨 Design System

### Color Palette (Consistent with Login)
- **Light Latte** (#D6B588) - OTP card background
- **Cream Grey** (#C6C0B9) - Screen background
- **Coffee Brown** (#705E46) - Secondary text, disabled states
- **Dark Espresso** (#422701) - Primary button, active text

### Visual Style
- Minimal and professional aesthetic
- Soft shadows and rounded corners
- Clear visual hierarchy
- One-hand mobile optimization
- Strong contrast for accessibility

## 📁 Component Structure

```
screens/otp_verification/
└── otp_verification_screen.dart    # Main OTP screen

widgets/
├── inputs/
│   └── otp_input_field.dart        # Individual OTP input boxes
├── buttons/
│   └── resend_otp_button.dart      # Countdown timer button
├── cards/
│   └── otp_card.dart               # OTP container card
└── headers/
    └── otp_header.dart             # Title and subtitle
```

## ✨ Features

### 1. OTP Input Field
- **6 individual input boxes** (configurable: 4-6 digits)
- **Auto-focus** to next box on digit entry
- **Backspace navigation** to previous box
- **Active box highlighting** with dark espresso border
- **Rounded corners** (12px radius)
- **White background** with subtle border
- **Large, bold numbers** for easy reading

### 2. Verify Button
- **Disabled state** when OTP incomplete
  - Reduced opacity (50%)
  - No interaction
  - Maintains dark espresso color
- **Enabled state** when all digits entered
  - Full opacity
  - Strong contrast
  - Tappable with feedback

### 3. Resend OTP Button
- **Countdown timer** (default: 30 seconds)
- **Disabled during countdown** showing "Resend in Xs"
- **Enabled after countdown** showing "Resend OTP"
- **Muted colors** when disabled
- **Underlined text** when active
- **Auto-restart countdown** on resend

### 4. Header Section
- **App logo** (reused from login screen)
- **Title**: "Verify your phone number"
- **Subtitle**: "Enter the 6-digit code sent to your number"
- **Phone number display** showing the number entered

### 5. Navigation
- **Back to Login** button at the bottom
- **No drawer menu** for security focus
- **Clean, distraction-free** interface

## 🔧 Usage

### From Login Screen
```dart
// Navigate to OTP screen after phone number entry
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => OTPVerificationScreen(
      phoneNumber: '+1 5551234567',
    ),
  ),
);
```

### OTP Configuration
```dart
// Change OTP length in otp_verification_screen.dart
static const int _otpLength = 6; // Change to 4 for 4-digit OTP
```

### Countdown Timer
```dart
// Change countdown duration in otp_card.dart
ResendOTPButton(
  onResend: onResend,
  countdownSeconds: 30, // Adjust seconds here
)
```

## 🎯 UX Behaviors

### Input Behavior
1. User taps first box → Keyboard appears
2. User enters digit → Auto-focus to next box
3. User completes OTP → Verify button enables
4. User taps Verify → OTP validation triggered

### Resend Flow
1. Screen loads → Countdown starts (30s)
2. User waits → Button shows "Resend in Xs"
3. Countdown ends → Button becomes active
4. User taps Resend → New OTP sent, countdown restarts

### Error States
- Invalid OTP → Show error snackbar
- Network error → Show retry message
- Too many attempts → Show lockout message

## 🔒 Security Considerations

- **No OTP pre-fill** for security
- **Single-use codes** (implement on backend)
- **Time-limited validity** (5-10 minutes)
- **Rate limiting** on resend attempts
- **Auto-clear on navigation back**

## 📱 Responsive Design

### Mobile Optimization
- **56px box width** - Easy thumb tapping
- **64px box height** - Adequate tap target
- **24px horizontal padding** - Edge breathing room
- **Evenly spaced boxes** - Visual balance
- **Scrollable content** - Keyboard safe area

### Accessibility
- **High contrast** text and borders
- **Large touch targets** (48dp minimum)
- **Clear visual feedback** on focus
- **Readable font sizes** (24px for OTP digits)
- **Descriptive labels** for screen readers

## 🧪 Testing Checklist

- [ ] OTP input accepts only numbers
- [ ] Auto-focus works correctly
- [ ] Backspace navigation functions
- [ ] Verify button enables/disables properly
- [ ] Countdown timer displays correctly
- [ ] Resend button becomes active after countdown
- [ ] Navigation back to login works
- [ ] Error messages display properly
- [ ] Keyboard doesn't obscure inputs
- [ ] Works on different screen sizes

## 🚀 Future Enhancements

- [ ] Auto-read OTP from SMS (Android)
- [ ] Biometric verification option
- [ ] Voice OTP for accessibility
- [ ] WhatsApp OTP alternative
- [ ] Progressive error messaging
- [ ] Animation on successful verification
- [ ] Haptic feedback on input

## 📝 Code Quality

- ✅ Modular component structure
- ✅ Reusable widgets
- ✅ Clean state management
- ✅ Proper dispose methods
- ✅ Consistent styling
- ✅ Well-documented code
- ✅ No code duplication
- ✅ Production-ready

## 🔄 Integration Flow

```
Login Screen
    ↓ (Enter phone number)
OTP Verification Screen
    ↓ (Verify OTP)
Home/Dashboard Screen
```

The OTP screen seamlessly integrates with the existing authentication flow while maintaining visual and functional consistency with the login screen.
