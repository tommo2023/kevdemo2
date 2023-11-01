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
    required this.searchString,
    super.key,
  });

  /// The list of [House] objects to display and search within.
  final List<House> houses;

  /// The search string used to filter the list of [House] objects.
  final String searchString;

  @override
  State<SearchableListViewWidget> createState() =>
      _SearchableListViewWidgetState();
}

class _SearchableListViewWidgetState extends State<SearchableListViewWidget> {
  late TextEditingController _searchController;
  String _enteredText = '';
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
      _enteredText = value;
    });
  }

  void clearSearch() {
    setState(() {
      _searchController.clear();
      _enteredText = '';
      context.read<HousesBloc>().add(
            HousesRequestedEvent(),
          );
    });
  }

  void doSearch(String searchText) {
    setState(() {
      context.read<HousesBloc>().add(
            HousesFilteredRequestedEvent(
              filterText: searchText,
            ),
          );
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
                onSubmitted: doSearch,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                controller: _searchController,
                onChanged: handleTextChange,
                decoration: InputDecoration(
                  hintText: widget.houses.isNotEmpty
                      ? 'Search for a home'
                      : widget.searchString,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .hint
                      .withColor(CustomColors.medium),
                  fillColor: CustomColors.lightGray,
                  suffixIcon: _enteredText.isNotEmpty
                      ? IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/ic_close.svg',
                          ),
                          onPressed: clearSearch,
                        )
                      : IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/ic_search.svg',
                          ),
                          onPressed: () => doSearch(_enteredText),
                        ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 20,
                  ),
                  border: InputBorder.none,
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
