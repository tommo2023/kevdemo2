import 'package:get_it/get_it.dart';
import 'package:kevdemo2/features/house_detail/presentation/bloc/house_bloc.dart';
import 'package:kevdemo2/features/overview/data/datasources/fixtures/house_fixtures_repository.dart';
import 'package:kevdemo2/features/overview/data/datasources/houses_api.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses_filtered.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:kevdemo2/shared/geolocation_service.dart';

/// Service locator global variable
final sl = GetIt.instance;

/// Initialises the services
void setUpLocator() {
  final houseRepositoryAPI = sl.registerSingleton<HousesFixtureRepository>(
    HousesFixtureRepository(),
  );
  final getHouses = sl.registerSingleton<GetHouses>(
    GetHouses(
      housesRepository: houseRepositoryAPI,
    ),
  );
  final getHousesFiltered = sl.registerSingleton<GetHousesFiltered>(
    GetHousesFiltered(housesRepository: houseRepositoryAPI),
  );
  sl
    ..registerSingleton<HousesBloc>(
      HousesBloc(getHouses: getHouses, getHousesFiltered: getHousesFiltered),
    )
    ..registerSingleton<HouseBloc>(HouseBloc())
    ..registerSingleton<HousesApi>(HousesApi())
    ..registerSingleton<GeolocationService>(GeolocationService());
}
