import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:kevdemo2/features/overview/presentation/widgets/house_item_widget.dart';
import 'package:kevdemo2/features/overview/presentation/widgets/search_not_found_widget.dart';
import 'package:kevdemo2/service_locator.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/geolocation_service.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:sizer/sizer.dart';

/// This widget allows users to search and filter a list of [House] objects.
class SearchableListViewWidget extends StatefulWidget {
  /// Creates a [SearchableListViewWidget] instance with the provided [houses].
  const SearchableListViewWidget({
    required this.houses,
    super.key,
  });

  /// The list of [House] objects to display and search within.
  final List<House> houses;

  @override
  State<SearchableListViewWidget> createState() =>
      _SearchableListViewWidgetState();
}

class _SearchableListViewWidgetState extends State<SearchableListViewWidget> {
  late TextEditingController _searchController;
  String enteredText = '';
  bool _isCalculateDistance = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    final geolocationService = sl<GeolocationService>();
    _isCalculateDistance = geolocationService.isLocationServiceAllowed;
  }

  void handleTextChange(String value) {
    setState(() {
      enteredText = value;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: SizedBox(
            height: 5.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10.0.sp),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                style: Theme.of(context).textTheme.hint,
                controller: _searchController,
                onChanged: handleTextChange,
                decoration: InputDecoration(
                  fillColor: CustomColors.lightGray,
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/ic_search.svg',
                    ),
                    onPressed: () {
                      context.read<HousesBloc>().add(
                            HousesFilteredRequestedEvent(
                              filterText: enteredText,
                            ),
                          );
                    },
                  ),
                  border: InputBorder.none,
                  hintText: '  Search for a home',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.houses.isEmpty
              ? const SearchNotFoundWidget()
              : Padding(
                  padding: EdgeInsets.only(top: 2.w),
                  child: ListView.builder(
                    itemCount: widget.houses.length,
                    itemBuilder: (context, index) {
                      return HouseItemWidget(
                        house: widget.houses[index],
                        isCalculateDistance: _isCalculateDistance,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
