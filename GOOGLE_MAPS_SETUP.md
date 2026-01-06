# Google Maps Setup Guide

## Overview
To enable the Google Maps functionality in the Rider app, you need to set up Google Maps API keys for both Android and iOS platforms.

## Steps to Get Google Maps API Key

1. **Go to Google Cloud Console**
   - Visit: https://console.cloud.google.com/

2. **Create or Select a Project**
   - Create a new project or select an existing one

3. **Enable Required APIs**
   - Go to "APIs & Services" > "Library"
   - Enable the following APIs:
     - Maps SDK for Android
     - Maps SDK for iOS
     - Directions API (optional, for route planning)
     - Places API (optional, for place search)

4. **Create API Credentials**
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"
   - Copy the API key

5. **Restrict Your API Key** (Important for security)
   - Click on the created API key
   - Under "API restrictions", select "Restrict key"
   - Choose the APIs you enabled above
   - Under "Application restrictions", choose appropriate restriction

## Android Configuration

1. **Add your API key to AndroidManifest.xml**
   
   Open `android/app/src/main/AndroidManifest.xml` and add:

   ```xml
   <application>
       <!-- Add this inside the application tag -->
       <meta-data
           android:name="com.google.android.geo.API_KEY"
           android:value="YOUR_ANDROID_API_KEY_HERE"/>
       
       <!-- Other application content -->
   </application>
   ```

2. **Add permissions in AndroidManifest.xml** (Already added in template below)
   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
   ```

## iOS Configuration

1. **Add your API key to AppDelegate.swift**
   
   Open `ios/Runner/AppDelegate.swift` and add:

   ```swift
   import UIKit
   import Flutter
   import GoogleMaps  // Add this import

   @UIApplicationMain
   @objc class AppDelegate: FlutterAppDelegate {
     override func application(
       _ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
     ) -> Bool {
       GMSServices.provideAPIKey("YOUR_IOS_API_KEY_HERE")  // Add this line
       GeneratedPluginRegistrant.register(with: self)
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
   }
   ```

2. **Add location permissions in Info.plist**
   
   Open `ios/Runner/Info.plist` and add:

   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs access to location when in use to show your current location on the map.</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>This app needs access to location to provide better service.</string>
   ```

## Testing Without API Key

For initial development and UI testing, the app will work but display a "For development purposes only" watermark on the map. To get a fully functional map, you must add your API keys.

## Security Best Practices

1. **Never commit API keys to version control**
   - Use environment variables or secure configuration files
   - Add API key files to `.gitignore`

2. **Restrict API keys by:**
   - Application (Android package name / iOS bundle ID)
   - IP addresses (for backend services)
   - Specific APIs only

3. **Monitor API usage** in Google Cloud Console to prevent unexpected charges

## Cost Information

- Google Maps Platform offers $200 free credit per month
- Mobile Maps SDK has no charge for most use cases
- Monitor usage at: https://console.cloud.google.com/billing

## Troubleshooting

### Map not showing
- Verify API key is correct
- Check if APIs are enabled in Google Cloud Console
- Ensure permissions are granted in device settings
- Check for errors in console/logcat

### Location not working
- Verify location permissions are added to manifest/Info.plist
- Check device location services are enabled
- Grant location permission to app in device settings

## Additional Resources

- [Google Maps Platform Documentation](https://developers.google.com/maps/documentation)
- [Flutter Google Maps Plugin](https://pub.dev/packages/google_maps_flutter)
- [Geolocator Plugin](https://pub.dev/packages/geolocator)
