import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kevdemo2/features/house_detail/presentation/bloc/house_bloc.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/features/shared/widgets/house_item_attributes_widget.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/global_constants.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:kevdemo2/shared/utils.dart';
import 'package:sizer/sizer.dart';

/// Widget to display details about a [House] and can
/// optionally calculate and display distance information based on the
/// [isCalculateDistance] flag.
class HouseItemWidget extends StatelessWidget {
  /// Creates a [HouseItemWidget] instance with the provided [house]
  /// and [isCalculateDistance] flag.
  const HouseItemWidget({
    required this.house,
    required this.isCalculateDistance,
    super.key,
  });

  /// The [House] to display information for.
  final House house;

  /// A flag indicating whether to calculate and display the distance.
  final bool isCalculateDistance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: InkWell(
        onTap: () {
          context.read<HouseBloc>().add(HouseRequestedEvent(house: house));

          context.push('/overview/house_detail');
        },
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 35,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0.sp),
                            child: SizedBox(
                              width: 20.w,
                              height: 10.h,
                              child: Image.network(
                                '$houseImageDomain${house.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 75,
                      child: SizedBox(
                        // color: Colors.blue,
                        width: 50.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${formatNumberWithCommas(house.price)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .title03
                                  .withFontWeight(FontWeight.bold),
                            ),
                            Text(
                              '${house.zip.replaceAll(' ', '')} ${house.city}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .withColor(CustomColors.medium),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: HouseItemAttributesWidget(
                                house: house,
                                isCalculateDistance: isCalculateDistance,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
