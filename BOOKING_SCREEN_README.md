# 🚗 Modern Vehicle Booking Home Screen

A beautiful, modern, and user-friendly vehicle booking home screen similar to Uber, built with Flutter.

## ✨ Features

### 🗺️ Interactive Map
- Full-screen Google Maps background
- Real-time GPS location tracking
- Custom markers for pickup location
- Smooth camera animations

### 📍 Location Services
- **Pickup Location Indicator**: Displays current GPS location with visual indicator
- **"Where to?" Search Bar**: Prominent destination search interface
- **Location Permissions**: Automatic permission handling

### 🚙 Vehicle Selection
Five vehicle types with detailed information:
- **Bike**: ₹49 | 2 min | 1 passenger
- **Auto**: ₹89 | 3 min | 3 passengers
- **Mini**: ₹129 | 4 min | 4 passengers
- **Sedan**: ₹179 | 5 min | 4 passengers
- **SUV**: ₹249 | 6 min | 6 passengers

Each card displays:
- Vehicle icon
- Price estimate
- ETA (Estimated Time of Arrival)
- Passenger capacity

### 💳 Payment Integration
- Payment method preview (UPI/Cash/Card)
- Quick payment method switching
- Secure payment indicator

### 🎨 Modern UI Design
- **Minimal & Clean**: Uncluttered interface
- **Rounded Cards**: Soft shadows and gradients
- **Professional Colors**: Green/Blue accents on white/grey base
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Animations**: Card selection and transitions

### 🛡️ Safety Features
- **SOS Button**: Prominent red emergency button
- **Profile Access**: Quick access to user profile
- **Location Tracking**: Real-time location monitoring

### 🎯 Call-to-Actions
- Bold "Book Ride" button with green accent
- Fare estimate display
- Clear visual feedback on selections

## 📱 Screenshots

The screen includes:
- Full-screen map with current location marker
- Top bar with profile icon and SOS button
- Destination search bar with shadow effect
- Pickup location indicator card
- Horizontal scrolling vehicle selection cards
- Payment method selector
- Large "Book Ride" CTA button
- Fare estimate text

## 🏗️ Architecture

### File Structure
```
lib/screens/home/
├── booking_home_screen.dart          # Main booking screen
├── home_screen.dart                   # Wrapper screen
└── widgets/
    ├── destination_search_bar.dart    # "Where to?" search bar
    ├── pickup_location_indicator.dart # Location display widget
    └── vehicle_type_card.dart         # Vehicle selection card
```

### Key Components

#### BookingHomeScreen
Main stateful widget managing:
- Google Maps controller
- Location services
- Vehicle selection state
- Payment method state
- UI layout and interactions

#### Widgets
- **DestinationSearchBar**: Prominent search input for destination
- **PickupLocationIndicator**: Shows current location with green dot
- **VehicleTypeCard**: Reusable card for vehicle selection

## 🎨 Design System

### Colors (AppColors)
```dart
// Primary Actions
primaryGreen:   #00C853
darkGreen:      #00A844
accentBlue:     #2962FF

// Base Colors
pureWhite:      #FFFFFF
lightGrey:      #F5F5F5
mediumGrey:     #BDBDBD
darkGrey:       #424242
almostBlack:    #212121

// Status Colors
warningRed:     #D32F2F
successGreen:   #43A047
infoBlue:       #1976D2
```

### Typography
- **Primary Font**: SF Pro Display
- **Sizes**: 11-18pt for UI elements
- **Weights**: Regular (400), Medium (500), Semibold (600), Bold (700)

### Spacing
- Card Padding: 16-20px
- Element Spacing: 8-16px
- Border Radius: 8-24px
- Shadow Blur: 8-20px

## 🔧 Setup & Configuration

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Configure Google Maps
See [GOOGLE_MAPS_SETUP.md](GOOGLE_MAPS_SETUP.md) for detailed instructions.

**Quick Setup:**
1. Get API key from Google Cloud Console
2. Add to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
3. Add to `ios/Runner/AppDelegate.swift`:
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
   ```

### 3. Location Permissions

**Android** (already configured):
- ACCESS_FINE_LOCATION
- ACCESS_COARSE_LOCATION
- INTERNET

**iOS** (add to Info.plist):
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access to show your current location</string>
```

## 🚀 Usage

### Basic Implementation
```dart
// Navigate to booking screen after login
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BookingHomeScreen(
      phoneNumber: userPhoneNumber,
    ),
  ),
);
```

### Customization

#### Change Default Location
```dart
static const LatLng _defaultLocation = LatLng(28.6139, 77.2090);
```

#### Modify Vehicle Types
```dart
final List<Map<String, dynamic>> _vehicleTypes = [
  {
    'type': 'Custom',
    'icon': Icons.your_icon,
    'price': '₹99',
    'eta': '3 min',
    'capacity': '2',
  },
];
```

#### Update Colors
Edit `lib/theme/app_colors.dart`:
```dart
static const primaryGreen = Color(0xFF00C853); // Your color
```

## 📦 Dependencies

```yaml
dependencies:
  google_maps_flutter: ^2.5.0      # Google Maps integration
  geolocator: ^10.1.0              # GPS location services
  permission_handler: ^11.0.1      # Permission management
  flutter_polyline_points: ^2.0.0  # Route polylines
```

## 🎯 Features Roadmap

### Implemented ✅
- [x] Full-screen interactive map
- [x] GPS location tracking
- [x] Destination search bar UI
- [x] Vehicle type selection with 5 options
- [x] Price estimates and ETA
- [x] Payment method preview
- [x] Book ride button
- [x] Profile and SOS buttons
- [x] Modern UI with shadows and gradients
- [x] Responsive design

### Upcoming 🚧
- [ ] Destination search functionality
- [ ] Route drawing on map
- [ ] Real-time vehicle tracking
- [ ] Price calculation algorithm
- [ ] Payment gateway integration
- [ ] Ride history
- [ ] Driver rating system
- [ ] Push notifications
- [ ] Multi-language support

## 🔍 Code Highlights

### State Management
```dart
String? _selectedVehicleType;
String _paymentMethod = 'UPI';
Position? _currentPosition;
GoogleMapController? _mapController;
```

### Location Tracking
```dart
Future<void> _getCurrentLocation() async {
  LocationPermission permission = await Geolocator.checkPermission();
  Position position = await Geolocator.getCurrentPosition();
  // Update UI with location
}
```

### Vehicle Selection
```dart
void _selectVehicle(String vehicleType) {
  setState(() {
    _selectedVehicleType = vehicleType;
  });
}
```

## 🎨 UI/UX Principles

1. **Mobile-First**: Designed specifically for mobile devices
2. **Touch-Friendly**: Large tap targets (44pt minimum)
3. **Visual Hierarchy**: Important actions prominently displayed
4. **Feedback**: Clear visual feedback for all interactions
5. **Accessibility**: High contrast ratios and readable fonts
6. **Performance**: Smooth animations and transitions

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (iOS 12.0+)
- ⚠️ Web (Limited map functionality)

## 🐛 Known Issues

1. **Map Watermark**: "For development purposes only" shows without proper API key
2. **Location Permission**: May require manual permission grant on first launch
3. **Background Location**: Not implemented for continuous tracking

## 💡 Tips

1. **Testing Without API Key**: UI will work but map shows watermark
2. **Emulator Location**: Use emulator controls to set mock location
3. **API Costs**: Monitor Google Maps API usage to avoid unexpected charges
4. **Custom Markers**: Replace default markers with custom icons for branding

## 🤝 Contributing

To enhance the booking screen:
1. Follow existing code structure
2. Maintain design consistency
3. Add comments for complex logic
4. Test on both Android and iOS

## 📄 License

This project is part of the Rider application.

## 📞 Support

For issues or questions:
- Check GOOGLE_MAPS_SETUP.md for configuration help
- Review Flutter documentation for widget usage
- Check Google Maps Platform documentation for API issues

---

**Built with ❤️ using Flutter**
