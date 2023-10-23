import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kevdemo2/features/house_detail/presentation/bloc/house_bloc.dart';
import 'package:kevdemo2/features/house_detail/presentation/widgets/house_detail_widget.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:sizer/sizer.dart';

/// The page that displays House Details
class HouseDetailPage extends StatefulWidget {
  /// Create the [HouseDetailPage]
  const HouseDetailPage({
    required this.title,
    super.key,
  });

  /// The title for the page
  final String title;

  @override
  State<HouseDetailPage> createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.lightGray,
        height: 100.h,
        child: BlocBuilder<HouseBloc, HouseState>(
          builder: (context, state) {
            if (state is HouseLoaded) {
              return HouseDetailWidget(house: state.house);
            }
            return const Text('Opening ...');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.transparent,
        elevation: 0,
        onPressed: () {
          context.pop();
        },
        child: SvgPicture.asset(
          'assets/icons/ic_back.svg',
          colorFilter: const ColorFilter.mode(
            CustomColors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
