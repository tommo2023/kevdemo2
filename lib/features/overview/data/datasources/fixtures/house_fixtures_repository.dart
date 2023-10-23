import 'package:kevdemo2/features/overview/data/datasources/fixtures/houses_fixture.dart';
import 'package:kevdemo2/features/overview/data/repositories/houses_repository.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';

/// A repository implementation that provides
/// house data from a fixture (mocked data).
class HousesFixtureRepository implements HousesRepository {
  /// The list of mock houses obtained from the fixture.
  final houses = HousesFixture.houses;

  @override
  Future<List<House>> getHouses() async {
    // Simulates a delay to mimic the network request.
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    return houses;
  }

  @override
  Future<List<House>> getHousesFiltered(String filterText) async {
    // Retrieves the full list of houses and filters them
    // based on the [filterText].
    final housesList = await getHouses();
    return housesList
        .where(
          (item) =>
              item.city.toLowerCase().contains(filterText.toLowerCase()) ||
              item.zip.toLowerCase().contains(filterText.toLowerCase()),
        )
        .toList();
  }
}
