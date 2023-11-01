import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/service_locator.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/geolocation_service.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:sizer/sizer.dart';

/// This widget is responsible for showing attributes of a [House], such as
/// price, bedrooms, bathrooms, and calculating the
/// distance from the current location
/// if [isCalculateDistance] is `true`. It relies on
/// the [GeolocationService] for distance calculations.
class HouseItemAttributesWidget extends StatelessWidget {
  /// Creates a [HouseItemAttributesWidget] instance
  /// with the provided [house] details.
  ///
  /// The [isCalculateDistance] flag indicates whether to
  /// calculate the distance from the current location.
  HouseItemAttributesWidget({
    required this.house,
    required this.isCalculateDistance,
    super.key,
  });

  /// The [House] object containing attributes to display.
  final House house;

  /// A flag indicating whether to calculate the distance
  /// from the current location.
  final bool isCalculateDistance;

  /// An instance of [GeolocationService] for distance calculations.
  final GeolocationService geolocationService = sl<GeolocationService>();

  @override
  Widget build(BuildContext context) {
    var distanceString = 'n/a';
    if (isCalculateDistance == true) {
      final distance =
          geolocationService.getDistanceKilometresFromCurrentLocation(
        house.latitude,
        house.longitude,
      );
      distanceString = '${distance.toStringAsFixed(1)} km';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/ic_bed.svg',
          colorFilter: const ColorFilter.mode(
            CustomColors.medium,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          '${house.bedrooms}',
          style: Theme.of(context)
              .textTheme
              .subtitle
              .withColor(CustomColors.medium),
        ),
        SizedBox(
          width: 2.w,
        ),
        SvgPicture.asset(
          'assets/icons/ic_bath.svg',
          colorFilter: const ColorFilter.mode(
            CustomColors.medium,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          '${house.bathrooms}',
          style: Theme.of(context)
              .textTheme
              .subtitle
              .withColor(CustomColors.medium),
        ),
        SizedBox(
          width: 2.w,
        ),
        SvgPicture.asset(
          'assets/icons/ic_layers.svg',
          colorFilter: const ColorFilter.mode(
            CustomColors.medium,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          '${house.bathrooms}',
          style: Theme.of(context)
              .textTheme
              .subtitle
              .withColor(CustomColors.medium),
        ),
        SizedBox(
          width: 2.w,
        ),
        SvgPicture.asset(
          'assets/icons/ic_location.svg',
          colorFilter: const ColorFilter.mode(
            CustomColors.medium,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Flexible(
          child: Text(
            distanceString,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .withColor(CustomColors.medium),
          ),
        ),
      ],
    );
  }
}
