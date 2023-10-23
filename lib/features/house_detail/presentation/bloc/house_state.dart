part of 'house_bloc.dart';

/// This class serves as a base for different states of House
abstract class HouseState extends Equatable {
  /// Initializes a new [HouseState].
  const HouseState();
  @override
  List<Object?> get props => [];
}

/// Represents the initial state
class HouseInitial extends HouseState {}

/// Represents a state indicating that a house has been successfully loaded.
class HouseLoaded extends HouseState {
  /// Creates a [HouseLoaded] instance with the loaded [house].
  const HouseLoaded({required this.house});

  /// The house that has been loaded.
  final House house;

  @override
  List<Object?> get props => [house];
}
