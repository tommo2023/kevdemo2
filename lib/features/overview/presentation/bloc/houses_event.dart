part of 'houses_bloc.dart';

/// The base abstract class for events related to houses.
///
/// All events that are related to houses should extend this class.
abstract class HousesEvent extends Equatable {
  /// Creates a [HousesEvent]
  const HousesEvent();

  @override
  List<Object?> get props => [];
}

/// An event that represents a request to load houses.
class HousesRequestedEvent extends HousesEvent {}

/// An event that represents a filtered request to load houses.
///
/// The [filterText] parameter specifies the text used for filtering houses.
class HousesFilteredRequestedEvent extends HousesEvent {
  /// Creates a [HousesFilteredRequestedEvent] indicating a filtered request
  /// to load houses with the provided [filterText].
  ///
  /// - [filterText]: The text used for filtering houses.
  const HousesFilteredRequestedEvent({required this.filterText});

  /// The text used for filtering houses.
  final String filterText;

  @override
  List<Object?> get props => [filterText];
}
