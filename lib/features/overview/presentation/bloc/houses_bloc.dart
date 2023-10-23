import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses.dart';
import 'package:kevdemo2/features/overview/domain/usecases/get_houses_filtered.dart';
import 'package:kevdemo2/logging.dart';

part 'houses_event.dart';
part 'houses_state.dart';

/// A BLoC that manages the state for a list of houses.
///
///  This BLoC  works with two use cases:
///  [GetHouses] and [GetHousesFiltered].
class HousesBloc extends Bloc<HousesEvent, HousesState> {
  /// Creates a [HousesBloc] instance with an initial state of [HousesInitial].
  ///
  /// The [getHouses] and [getHousesFiltered] are required use cases used for
  /// fetching houses and filtered houses.
  HousesBloc({
    required GetHouses getHouses,
    required GetHousesFiltered getHousesFiltered,
  }) : super(HousesInitial()) {
    on<HousesRequestedEvent>((event, emit) async {
      emit(HousesLoading());

      try {
        final houses = await getHouses();
        houses.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        emit(HousesLoaded(houses: houses));
      } catch (e) {
        logger.warning(
          'on<HousesRequestedEvent>:HouseError '
          'Failed to load data from the API',
        );

        emit(
          const HousesError(
            message: 'Unable to load houses data, please retry later',
          ),
        );
      }
    });
    on<HousesFilteredRequestedEvent>((event, emit) async {
      emit(HousesLoading());
      try {
        final houses = await getHousesFiltered(event.filterText);
        houses.sort((a, b) => a.price.compareTo(b.price));
        emit(HousesLoaded(houses: houses));
      } catch (e) {
        logger.warning(
          'on<HousesFilteredRequestedEvent>:HouseError '
          'Failed to load data from the API',
        );
        emit(
          const HousesError(
            message: 'Unable to load houses search data, please retry later',
          ),
        );
      }
    });
  }
}
