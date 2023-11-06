// ignore_for_file: public_member_api_docs
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kevdemo2/features/house_detail/presentation/bloc/house_bloc.dart';
import 'package:kevdemo2/features/information/presentation/views/information_page.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:kevdemo2/features/overview/presentation/views/overview_page.dart';
import 'package:kevdemo2/firebase_options.dart';
import 'package:kevdemo2/logging.dart';
import 'package:kevdemo2/routes/routes.dart';
import 'package:kevdemo2/service_locator.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    // ... other providers
  ]);

  // setUpAuthorization();
  setUpLocator();
  setUpLogging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HousesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<HouseBloc>(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            routerConfig: goRouter,
            title: 'Houses',
            theme: ThemeData(
              fontFamily: 'GothamSsm',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Index of the currently selected tab

  final List<Widget> _pages = [
    const OverviewPage(
      title: 'Overview',
    ),
    const InformationPage(
      title: 'Information',
    ),
  ];

  // Function to change the selected tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              colorFilter: const ColorFilter.mode(
                CustomColors.light,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              colorFilter: const ColorFilter.mode(
                CustomColors.strong,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_info.svg',
              colorFilter: const ColorFilter.mode(
                CustomColors.light,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_info.svg',
              colorFilter: const ColorFilter.mode(
                CustomColors.strong,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex, // The current selected tab
        onTap: _onItemTapped, // Function to call when a tab is tapped
      ),
    );
  }
}
