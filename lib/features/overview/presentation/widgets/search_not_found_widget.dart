import 'package:flutter/material.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:sizer/sizer.dart';

/// This widget is used to indicate that no search results were found for the
/// given query.
///
class SearchNotFoundWidget extends StatelessWidget {
  /// Creates a [SearchNotFoundWidget] instance.
  const SearchNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 60.w,
          child: Image.asset('assets/images/search_state_empty.png'),
        ),
        SizedBox(
          height: 10.w,
        ),
        Text(
          'No results found!',
          style:
              Theme.of(context).textTheme.detail.withColor(CustomColors.light),
        ),
        Text(
          'Perhaps try another search?',
          style: Theme.of(context).textTheme.hint.withColor(CustomColors.light),
        ),
      ],
    );
  }
}
