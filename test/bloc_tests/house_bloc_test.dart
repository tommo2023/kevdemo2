// ignore_for_file: inference_failure_on_function_invocation

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevdemo2/features/overview/data/datasources/fixtures/house_fixtures_repository.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses_filtered.dart';
import 'package:kevdemo2/features/overview/presentation/bloc/houses_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetHouses extends Mock implements GetHouses {}

class MockGetHousesFiltered extends Mock implements GetHousesFiltered {}

void main() {
  late HousesFixtureRepository housesFixtureRepository;
  late HousesBloc housesBloc;
  late GetHouses getHouses;
  late GetHousesFiltered getHousesFiltered;
  group('HousesBloc', () {
    setUp(() {
      housesFixtureRepository = HousesFixtureRepository();
      getHouses = MockGetHouses();
      getHousesFiltered = MockGetHousesFiltered();
      housesBloc = HousesBloc(
        getHouses: getHouses,
        getHousesFiltered: getHousesFiltered,
      );
    });

    tearDown(() {
      housesBloc.close();
    });
    blocTest(
      'emits [HousesLoading, HousesLoaded] when HousesRequestedEvent is added',
      build: () {
        when(
          () => getHouses.call(),
        ).thenAnswer((_) async => housesFixtureRepository.getHouses());
        return housesBloc;
      },
      act: (bloc) => bloc.add(HousesRequestedEvent()),
      wait: const Duration(milliseconds: 1200),
      expect: () => [isA<HousesLoading>(), isA<HousesLoaded>()],
    );

    blocTest(
      ' emits [HousesLoading, HousesLoaded] '
      'when HousesFilteredRequestedEvent is added',
      build: () {
        when(
          () => getHousesFiltered('Ams'),
        ).thenAnswer(
          (_) async => housesFixtureRepository.getHousesFiltered('Ams'),
        );
        return housesBloc;
      },
      act: (bloc) => bloc.add(
        const HousesFilteredRequestedEvent(filterText: 'Ams'),
      ),
      wait: const Duration(milliseconds: 1200),
      expect: () => [isA<HousesLoading>(), isA<HousesLoaded>()],
    );

    blocTest(
      'emits [HousesLoading, HousesError] when loading houses fails',
      build: () {
        when(
          () => getHouses(),
        ).thenThrow(Exception('GetHouses Error'));
        return housesBloc;
      },
      act: (bloc) => bloc.add(HousesRequestedEvent()),
      wait: const Duration(milliseconds: 1200),
      expect: () => [isA<HousesLoading>(), isA<HousesError>()],
    );

    blocTest(
      'emits [HousesLoading, HousesError] when filtering houses fails',
      build: () {
        when(
          () => getHousesFiltered('Ams'),
        ).thenThrow(Exception('GetHousesFiltered Error'));
        return housesBloc;
      },
      act: (bloc) =>
          bloc.add(const HousesFilteredRequestedEvent(filterText: '1')),
      wait: const Duration(milliseconds: 1200),
      expect: () => [isA<HousesLoading>(), isA<HousesError>()],
    );
  });
}
