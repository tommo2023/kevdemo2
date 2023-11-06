import 'package:go_router/go_router.dart';
import 'package:kevdemo2/features/house_detail/presentation/views/house_detail_page.dart';
import 'package:kevdemo2/features/shared/views/splash_screen.dart';
import 'package:kevdemo2/main.dart';
import 'package:kevdemo2/shared/authorization/auth_gate.dart';

/// GoRouter configuration
final goRouter = GoRouter(
  initialLocation: '/auth_gate',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth_gate',
      builder: (context, state) => const AuthGate(),
    ),
    // TODO(kevin): Clean up unused routes
    // GoRoute(
    //   path: '/sign_in',
    //   builder: (context, state) => const SignInScreen(providers: []),
    // ),
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
