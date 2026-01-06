import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../theme/app_colors.dart';
import 'widgets/destination_search_bar.dart';
import 'widgets/vehicle_type_card.dart';
import 'widgets/pickup_location_indicator.dart';

/// Modern Vehicle Booking Home Screen
/// 
/// Features:
/// - Full-screen interactive Google Maps
/// - Current location pickup indicator
/// - Destination search bar
/// - Vehicle type selection cards
/// - Fare estimate and booking button
/// - Profile and SOS icons
class BookingHomeScreen extends StatefulWidget {
  final String phoneNumber;

  const BookingHomeScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<BookingHomeScreen> createState() => _BookingHomeScreenState();
}

class _BookingHomeScreenState extends State<BookingHomeScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  String _pickupAddress = 'Getting your location...';
  String? _selectedVehicleType;
  String _paymentMethod = 'UPI';
  
  // Default location (will be replaced with actual location)
  static const LatLng _defaultLocation = LatLng(28.6139, 77.2090); // New Delhi
  LatLng _currentLatLng = _defaultLocation;
  
  // Vehicle types with pricing
  final List<Map<String, dynamic>> _vehicleTypes = [
    {
      'type': 'Bike',
      'icon': Icons.two_wheeler,
      'price': '₹49',
      'eta': '2 min',
      'capacity': '1',
    },
    {
      'type': 'Auto',
      'icon': Icons.electric_rickshaw,
      'price': '₹89',
      'eta': '3 min',
      'capacity': '3',
    },
    {
      'type': 'Mini',
      'icon': Icons.directions_car,
      'price': '₹129',
      'eta': '4 min',
      'capacity': '4',
    },
    {
      'type': 'Sedan',
      'icon': Icons.directions_car_filled,
      'price': '₹179',
      'eta': '5 min',
      'capacity': '4',
    },
    {
      'type': 'SUV',
      'icon': Icons.airport_shuttle,
      'price': '₹249',
      'eta': '6 min',
      'capacity': '6',
    },
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  /// Get current GPS location
  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _pickupAddress = 'Location permission denied';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        _currentLatLng = LatLng(position.latitude, position.longitude);
        _pickupAddress = 'Current Location';
      });

      // Move camera to current location
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentLatLng,
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _pickupAddress = 'Unable to get location';
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _selectVehicle(String vehicleType) {
    setState(() {
      _selectedVehicleType = vehicleType;
    });
  }

  void _bookRide() {
    if (_selectedVehicleType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a vehicle type'),
          backgroundColor: AppColors.warningRed,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking $_selectedVehicleType...'),
        backgroundColor: AppColors.successGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen Google Maps
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentLatLng,
              zoom: 15,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId('pickup'),
                position: _currentLatLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen,
                ),
              ),
            },
          ),

          // Top Section: Profile, SOS, and Search Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.almostBlack.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Top bar with profile and SOS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Profile Icon
                          GestureDetector(
                            onTap: () {
                              // Open profile menu
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.pureWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.person_outline,
                                color: AppColors.almostBlack,
                                size: 24,
                              ),
                            ),
                          ),

                          // SOS Button
                          GestureDetector(
                            onTap: () {
                              // Trigger SOS
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.warningRed,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.warningRed.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.warning_rounded,
                                    color: AppColors.pureWhite,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'SOS',
                                    style: TextStyle(
                                      color: AppColors.pureWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Destination Search Bar
                      DestinationSearchBar(
                        onTap: () {
                          // Open destination search screen
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Pickup Location Indicator
          Positioned(
            top: MediaQuery.of(context).padding.top + 140,
            left: 16,
            right: 16,
            child: PickupLocationIndicator(
              address: _pickupAddress,
              onTap: () {
                // Open location picker
              },
            ),
          ),

          // Bottom Section: Vehicle Selection and Booking
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vehicle Type Selection
                      const Text(
                        'Choose your ride',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.almostBlack,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Vehicle cards horizontal scroll
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _vehicleTypes.length,
                          itemBuilder: (context, index) {
                            final vehicle = _vehicleTypes[index];
                            final isSelected =
                                _selectedVehicleType == vehicle['type'];
                            
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: VehicleTypeCard(
                                type: vehicle['type'],
                                icon: vehicle['icon'],
                                price: vehicle['price'],
                                eta: vehicle['eta'],
                                capacity: vehicle['capacity'],
                                isSelected: isSelected,
                                onTap: () => _selectVehicle(vehicle['type']),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Payment Method Preview
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.payment,
                              color: AppColors.darkGrey,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Payment: $_paymentMethod',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.mediumGrey,
                              size: 20,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Book Ride Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _bookRide,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: AppColors.pureWhite,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Book Ride',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // Fare estimate (if vehicle selected)
                      if (_selectedVehicleType != null) ...[
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'Estimated fare: ${_vehicleTypes.firstWhere((v) => v['type'] == _selectedVehicleType)['price']}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
