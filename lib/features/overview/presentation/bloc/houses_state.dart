part of 'houses_bloc.dart';

/// Represents the various states of the HousesBloc.
abstract class HousesState extends Equatable {
  /// creates a [HousesState] state
  const HousesState();

  @override
  List<Object?> get props => [];
}

/// The initial state when the HousesBloc is first created.
class HousesInitial extends HousesState {}

/// A state indicating that houses are being loaded from a data source.
class HousesLoading extends HousesState {}

/// A state representing successfully loaded houses.
class HousesLoaded extends HousesState {
  /// Creates a [HousesLoaded] state with the provided list of [houses].
  ///
  /// - [houses]: A list of loaded house objects.
  const HousesLoaded({required this.houses});

  /// List of loaded house objects.
  final List<House> houses;

  @override
  List<Object?> get props => [houses];
}

/// A state representing an error in loading houses.
class HousesError extends HousesState {
  /// Creates a [HousesError] state with the provided error [message].
  ///
  /// - [message]: A descriptive error message.
  const HousesError({required this.message});

  /// A descriptive error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
