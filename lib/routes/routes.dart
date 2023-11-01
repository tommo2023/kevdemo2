import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:kevdemo2/features/house_detail/presentation/views/house_detail_page.dart';
import 'package:kevdemo2/features/shared/views/splash_screen.dart';
import 'package:kevdemo2/main.dart';

/// GoRouter configuration
final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SignInScreen(providers: providers),
    ),
    GoRoute(
      path: '/overview',
      builder: (context, state) => const MyHomePage(),
      routes: [
        GoRoute(
          path: 'house_detail',
          builder: (context, state) => const HouseDetailPage(
            title: 'House Details',
          ),
        ),
      ],
    ),
  ],
);
