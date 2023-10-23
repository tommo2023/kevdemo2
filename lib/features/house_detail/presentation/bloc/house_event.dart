part of 'house_bloc.dart';

/// Base class for all house-related events.
abstract class HouseEvent extends Equatable {
  /// Base Constructor
  const HouseEvent();

  @override
  List<Object?> get props => [];
}

/// An event representing a request for a specific [House].
class HouseRequestedEvent extends HouseEvent {
  /// Create a [HouseRequestedEvent] with the requested [house].
  const HouseRequestedEvent({required this.house});

  /// The requested house.
  final House house;

  @override
  List<Object?> get props => [house];
}
