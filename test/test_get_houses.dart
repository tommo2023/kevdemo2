import 'package:kevdemo2/features/overview/data/datasources/fixtures/houses_fixture.dart';
import 'package:kevdemo2/features/overview/data/repositories/houses_repository.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHousesRepository extends Mock implements HousesRepositoryApi {}

void main() {
  group('GetHouses', () {
    test('returns a list of houses when called', () async {
      final mockRepository = MockHousesRepository();
      final getHouses = GetHouses(housesRepository: mockRepository);

      when(mockRepository.getHouses)
          .thenAnswer((_) async => HousesFixture.houses);

      final result = await getHouses.call();

      expect(result, isA<List<House>>());
    });

    test('throws an exception when the repository call fails', () async {
      final mockRepository = MockHousesRepository();
      final getHouses = GetHouses(housesRepository: mockRepository);

      when(mockRepository.getHouses).thenThrow(Exception('Test Error'));

      expect(getHouses.call, throwsA(isA<Exception>()));
    });
  });
}
