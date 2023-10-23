import 'package:kevdemo2/features/overview/data/repositories/houses_repository.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';

/// A use case class for filtering and retrieving houses from a repository.
class GetHousesFiltered {
  /// Creates a [GetHousesFiltered] instance with a required [housesRepository].
  ///
  /// - [housesRepository]: The repository that provides access to house data.
  GetHousesFiltered({required this.housesRepository});

  /// The repository providing access to house data.
  final HousesRepository housesRepository;

  /// Retrieve a list of filtered houses from the repository.
  ///
  /// - [filterText]: The text used to filter houses.
  ///
  /// Returns a [Future] that completes with a list of filtered [House] objects.
  Future<List<House>> call(String filterText) async {
    final housesList = await housesRepository.getHousesFiltered(filterText);

    return housesList;
  }
}
