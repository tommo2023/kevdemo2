import 'package:kevdemo2/features/overview/data/datasources/houses_api.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/service_locator.dart';

/// An abstract class representing the contract for accessing
/// house-related data.
abstract class HousesRepository {
  /// Fetches a list of all houses.
  ///
  /// Returns a list of [House] objects.
  Future<List<House>> getHouses();

  /// Fetches a filtered list of houses based on [filterText].
  ///
  /// - [filterText]: The text used for filtering houses.
  ///
  /// Returns a list of [House] objects matching the filter.
  Future<List<House>> getHousesFiltered(String filterText);
}

/// A concrete implementation of [HousesRepository] that
/// uses the [HousesApi] for data retrieval.
class HousesRepositoryApi implements HousesRepository {
  @override
  Future<List<House>> getHouses() {
    final housesApi = sl<HousesApi>();
    return housesApi.getHouses();
  }

  @override
  Future<List<House>> getHousesFiltered(String filterText) {
    final housesApi = sl<HousesApi>();
    return housesApi.getHousesFiltered(filterText);
  }
}
