import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:kevdemo2/features/overview/presentation/widgets/searchable_list_view_widget.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:sizer/sizer.dart';

/// This widget is responsible for displaying information about a list  houses
class OverviewPage extends StatefulWidget {
  /// Creates an [OverviewPage] instance with the given [title].
  const OverviewPage({required this.title, super.key});

  /// The title of the overview page.
  final String title;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.lightGray,
        title: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'REAL ESTATE',
              style: Theme.of(context)
                  .textTheme
                  .title02
                  .withFontWeight(FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: CustomColors.lightGray,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: BlocBuilder<HousesBloc, HousesState>(
              builder: (context, state) {
                if (state is HousesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is HousesLoaded) {
                  return SearchableListViewWidget(houses: state.houses);
                } else if (state is HousesError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(state.message),
                        const Text('Check the internet connection'),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => context
                              .read<HousesBloc>()
                              .add(HousesRequestedEvent()),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                return const Text('Opening ...');
              },
            ),
          ),
        ),
      ),
    );
  }
}
