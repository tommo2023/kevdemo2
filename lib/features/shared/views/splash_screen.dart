import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:kevdemo2/service_locator.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/geolocation_service.dart';
import 'package:sizer/sizer.dart';

/// Opening splash screen
class SplashScreen extends StatefulWidget {
  /// Create the splash screen
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    final geolocationService = sl<GeolocationService>();
    await geolocationService.checkPosition();
    Future.delayed(Duration.zero, () {
      context.read<HousesBloc>().add(HousesRequestedEvent());
    });
    Future.delayed(const Duration(seconds: 4), () {
      context.pushReplacement('/overview');
    });
  }

  Future<void> initialise() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: CustomColors.red,
          ),
          GestureDetector(
            onTap: () => false,
            child: Center(
              child: Image.asset(
                'assets/images/launcher_icon.png',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
