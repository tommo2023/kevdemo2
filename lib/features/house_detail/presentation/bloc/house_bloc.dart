import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';

part 'house_event.dart';
part 'house_state.dart';

/// A [Bloc] responsible for managing the state of a single house.
class HouseBloc extends Bloc<HouseEvent, HouseState> {
  /// Creates a [HouseBloc] instance with an initial state of [HouseInitial].
  HouseBloc() : super(HouseInitial()) {
    /// When a [HouseRequestedEvent] is received, this method
    /// emits a new state of
    /// [HouseLoaded] with the provided [house].
    on<HouseRequestedEvent>((event, emit) {
      emit(HouseLoaded(house: event.house));
    });
  }
}
