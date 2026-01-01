# Rider App - Project Structure

## 📁 Folder Organization

```
lib/
├── main.dart                           # App entry point
├── theme/
│   └── app_colors.dart                 # Color palette constants
├── screens/
│   ├── login/
│   │   └── login_screen.dart           # Phone login screen
│   ├── otp_verification/
│   │   └── otp_verification_screen.dart # OTP verification screen
│   └── home/
│       └── home_screen.dart            # Home/Dashboard screen
└── widgets/
    ├── buttons/
    │   ├── primary_button.dart         # Primary CTA button
    │   ├── social_login_button.dart    # OAuth buttons (disabled)
    │   └── resend_otp_button.dart      # Resend OTP with countdown
    ├── inputs/
    │   ├── phone_input_field.dart      # Phone number input field
    │   └── otp_input_field.dart        # OTP digit input boxes
    ├── cards/
    │   ├── login_card.dart             # Login card container
    │   └── otp_card.dart               # OTP card container
    ├── headers/
    │   ├── login_header.dart           # App logo header
    │   ├── welcome_section.dart        # Welcome text
    │   └── otp_header.dart             # OTP verification header
    ├── dividers/
    │   └── social_login_divider.dart   # "or" divider
    ├── social_login/
    │   └── social_login_section.dart   # Social login buttons row
    └── footers/
        └── terms_and_privacy.dart      # Terms & privacy footer
```

## 🎯 Component Hierarchy

### Screens
- **LoginScreen** - Phone number entry and authentication
- **OTPVerificationScreen** - OTP code verification
- **HomeScreen** - Post-authentication landing page

### Widgets
#### Headers
- **LoginHeader** - App logo with shadow
- **WelcomeSection** - Title and subtitle text
- **OTPHeader** - OTP verification title and instructions

#### Cards
- **LoginCard** - Container for phone input and continue button
- **OTPCard** - Container for OTP inputs and verify button

#### Inputs
- **PhoneInputField** - Reusable phone input with validation
- **OTPInputField** - Individual digit input boxes with auto-focus

#### Buttons
- **PrimaryButton** - Active CTA button (Continue/Verify)
- **SocialLoginButton** - Disabled OAuth buttons (Google, Apple)
- **ResendOTPButton** - Resend OTP with countdown timer

#### Dividers
- **SocialLoginDivider** - Separator with "or" text

#### Social Login
- **SocialLoginSection** - Row of social OAuth buttons

#### Footers
- **TermsAndPrivacy** - Legal text with links

## 🎨 Design System

### Color Palette (Cappuccino Theme)
- **Light Latte** (#D6B588) - Login card background
- **Cream Grey** (#C6C0B9) - App background
- **Coffee Brown** (#705E46) - Secondary elements
- **Dark Espresso** (#422701) - Primary button & text

### Design Principles
- Premium, minimal aesthetic
- Clear visual hierarchy
- Accessible contrast ratios
- Production-ready components
- Modular and reusable widgets

## 🚀 Usage

### Running the App
```bash
flutter run
```

### Adding New Screens
1. Create a new folder in `screens/`
2. Add the screen file (e.g., `home_screen.dart`)
3. Import in `main.dart` and add routing

### Adding New Widgets
1. Choose appropriate category folder in `widgets/`
2. Create new widget file
3. Import in the screen that needs it

## 📝 Code Style
- Clean, documented code
- Each widget is self-contained
- Proper naming conventions
- Organized imports
- Production-ready standards

## 🔧 Features
- ✅ Phone number authentication
- ✅ OTP verification with countdown timer
- ✅ Input validation
- ✅ Auto-focus OTP input boxes
- ✅ Disabled state management
- ✅ Disabled social login buttons
- ✅ Navigation flow (Login → OTP → Home)
- ✅ Responsive layout
- ✅ Clean architecture
- ✅ Reusable components
- ✅ Production-ready code

## 🔄 Navigation Flow

```
Login Screen (Phone Entry)
        ↓
    [Continue]
        ↓
OTP Verification Screen
        ↓
    [Verify]
        ↓
Home Screen (Dashboard)
```

## 📱 Screen Features

### Login Screen
- Phone number input with country code
- Form validation
- Primary CTA button
- Social login options (disabled)
- Terms and privacy links

### OTP Verification Screen
- 6-digit OTP input boxes
- Auto-focus between inputs
- Verify button (enabled when complete)
- Resend OTP with 30s countdown
- Back to login option
- Phone number display

### Home Screen
- Welcome message
- Success confirmation
- Verified phone number display
