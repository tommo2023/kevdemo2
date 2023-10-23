import 'package:kevdemo2/features/overview/data/repositories/houses_repository.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';

/// Use case class to get all houses
class GetHouses {
  /// Creates a [GetHouses] instance with the provided [housesRepository].
  GetHouses({required this.housesRepository});

  /// The repository used for retrieving houses data.
  final HousesRepository housesRepository;

  /// Retrieves List of House(s) from repository
  Future<List<House>> call() async {
    final housesList = await housesRepository.getHouses();
    return housesList;
  }
}
