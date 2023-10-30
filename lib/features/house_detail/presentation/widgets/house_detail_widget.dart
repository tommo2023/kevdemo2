import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/features/shared/widgets/house_item_attributes_widget.dart';
import 'package:kevdemo2/service_locator.dart';
import 'package:kevdemo2/shared/geolocation_service.dart';
import 'package:kevdemo2/shared/global_constants.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:kevdemo2/shared/utils.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sizer/sizer.dart';

/// Widget to present details for the specified [house]
class HouseDetailWidget extends StatelessWidget {
  /// Creates the [HouseDetailWidget], [house] is required
  HouseDetailWidget({required this.house, super.key});

  /// The house details to be displayed
  final House house;
  final _isCalculateDistance =
      sl<GeolocationService>().isLocationServiceAllowed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 25.h,
          width: 100.w,
          child: Image.network(
            '$houseImageDomain${house.image}',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 20.h,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              width: 100.w,
              height: 80.h,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${formatNumberWithCommas(house.price)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .title02
                                  .withFontWeight(FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: HouseItemAttributesWidget(
                                house: house,
                                isCalculateDistance: _isCalculateDistance,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          'Description',
                          style: Theme.of(context)
                              .textTheme
                              .title01
                              .withFontWeight(FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Text(
                          house.description,
                          style: Theme.of(context).textTheme.body,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Text(
                          'Location',
                          style: Theme.of(context)
                              .textTheme
                              .title01
                              .withFontWeight(FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: SizedBox(
                          width: 100.w,
                          height: 37.5.h,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              MapsLauncher.launchCoordinates(
                                house.latitude,
                                house.longitude,
                              );
                            },
                            child: IgnorePointer(
                              child: GoogleMap(
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('House'),
                                    position: LatLng(
                                      house.latitude,
                                      house.longitude,
                                    ),
                                  ),
                                },
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                    house.latitude,
                                    house.longitude,
                                  ),
                                  zoom: 12,
                                ),
                              ),
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
        ),
      ],
    );
  }
}
