import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../theme/app_colors.dart';
import 'vehicle_details_screen.dart';

/// Vehicle Selection Screen with Map
/// 
/// Features:
/// - Light-themed map interface
/// - Route line display
/// - Bottom rounded card with vehicle carousel
/// - Horizontal car selection
/// - Yellow action button
class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  GoogleMapController? _mapController;
  int _selectedVehicleIndex = 0;
  
  static const LatLng _center = LatLng(28.6139, 77.2090);
  static const LatLng _destination = LatLng(28.6229, 77.2190);

  final List<Map<String, dynamic>> _vehicles = [
    {
      'name': 'Black Toyota Corolla',
      'type': 'Sedan',
      'price': '\$45',
      'rating': '4.9',
      'image': 'assets/images/corolla.png',
      'seats': '4',
      'transmission': 'Automatic',
      'fuel': 'Hybrid',
    },
    {
      'name': 'White BMW 3 Series',
      'type': 'Luxury Sedan',
      'price': '\$85',
      'rating': '5.0',
      'image': 'assets/images/bmw.png',
      'seats': '4',
      'transmission': 'Automatic',
      'fuel': 'Petrol',
    },
    {
      'name': 'Red Audi A4',
      'type': 'Premium Sedan',
      'price': '\$75',
      'rating': '4.8',
      'image': 'assets/images/audi.png',
      'seats': '4',
      'transmission': 'Automatic',
      'fuel': 'Diesel',
    },
  ];

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Light-themed map
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 13,
            ),
            mapType: MapType.normal,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                points: [_center, _destination],
                color: AppColors.premiumGold,
                width: 4,
              ),
            },
            markers: {
              Marker(
                markerId: const MarkerId('pickup'),
                position: _center,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow,
                ),
              ),
              Marker(
                markerId: const MarkerId('destination'),
                position: _destination,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ),
            },
          ),

          // Top bar with back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                          color: AppColors.premiumBlack,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Menu button
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.menu,
                        size: 20,
                        color: AppColors.premiumBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom vehicle selection card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag handle
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.midGray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Section title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Available Vehicles',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.premiumBlack,
                            ),
                          ),
                          Text(
                            '${_vehicles.length} cars',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.midGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Horizontal vehicle carousel
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = _vehicles[index];
                            final isSelected = index == _selectedVehicleIndex;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedVehicleIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 200,
                                margin: EdgeInsets.only(
                                  right: index < _vehicles.length - 1 ? 16 : 0,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.premiumGold.withOpacity(0.1)
                                      : AppColors.luxuryWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.premiumGold
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: AppColors.premiumGold
                                                .withOpacity(0.3),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Vehicle image placeholder
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: AppColors.softGray
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.directions_car,
                                            size: 60,
                                            color: isSelected
                                                ? AppColors.premiumGold
                                                : AppColors.midGray,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      // Vehicle name
                                      Text(
                                        vehicle['name'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? AppColors.premiumGold
                                              : AppColors.premiumBlack,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const SizedBox(height: 4),

                                      // Vehicle type
                                      Text(
                                        vehicle['type'],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.midGray,
                                        ),
                                      ),

                                      const Spacer(),

                                      // Price and rating
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                vehicle['price'],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: isSelected
                                                      ? AppColors.premiumGold
                                                      : AppColors.premiumBlack,
                                                ),
                                              ),
                                              const Text(
                                                '/day',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.midGray,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: AppColors.premiumGold,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                vehicle['rating'],
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.premiumBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Select button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VehicleDetailsScreen(
                                  vehicle: _vehicles[_selectedVehicleIndex],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.premiumGold,
                            foregroundColor: AppColors.premiumBlack,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: const Text(
                            'Select Vehicle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
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
