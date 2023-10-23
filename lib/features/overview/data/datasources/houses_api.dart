import 'package:dio/dio.dart';
import 'package:kevdemo2/features/overview/domain/entities/house.dart';
import 'package:kevdemo2/logging.dart';

/// A class for handling API requests related to houses.
class HousesApi {
  final Dio _dio = Dio();
  List<Map<String, dynamic>> _jsonMap = [];

  /// Fetches a list of houses from the API.
  ///
  /// Returns a list of [House] objects.
  Future<List<House>> getHouses() async {
    try {
      final headers = {
        'Access-Key': 'accessKey',
      };
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.get(
        'API_URL',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        _jsonMap = data.cast<Map<String, dynamic>>();
        return parseHousesFromJson(_jsonMap);
      } else {
        throw Exception(
          'Failed to load data. response.statusCode = ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.warning('getHouses:Error: $e');
      rethrow;
    }
  }

  /// Parses a list of JSON objects into a list of [House] objects.
  ///
  /// - [jsonMap]: A list of JSON objects representing houses.
  ///
  /// Returns a list of [House] objects.
  List<House> parseHousesFromJson(List<Map<String, dynamic>> jsonMap) {
    final housesList = <House>[];
    try {
      for (final houseData in jsonMap) {
        final house = House.fromJson(houseData);
        housesList.add(house);
      }
      return housesList;
    } catch (e) {
      logger.warning('parseHousesFromJson:Error: $e');
      rethrow;
    }
  }

  /// Fetches a list of filtered houses from the API based on [filterText].
  ///
  /// - [filterText]: The text used for filtering houses.
  ///
  /// Returns a list of [House] objects matching the filter.
  Future<List<House>> getHousesFiltered(String filterText) async {
    try {
      final headers = {
        'Access-Key': 'accessKey',
      };

      // ignore: inference_failure_on_function_invocation
      final response = await _dio.get(
        'API_URL',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        _jsonMap = data.cast<Map<String, dynamic>>();
        return parseHousesFromJsonFiltered(_jsonMap, filterText);
      } else {
        throw Exception(
          'Failed to load data. response.statusCode = ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.warning('getHousesFiltered:Error: $e');
      rethrow;
    }
  }

  /// Parses a list of JSON objects into a list of [House]
  /// objects and filters them based on [filterText].
  ///
  /// - [jsonMap]: A list of JSON objects representing houses.
  /// - [filterText]: The text used for filtering houses.
  ///
  /// Returns a filtered list of [House] objects.
  List<House> parseHousesFromJsonFiltered(
    List<Map<String, dynamic>> jsonMap,
    String filterText,
  ) {
    final housesList = <House>[];
    try {
      for (final houseData in jsonMap) {
        final house = House.fromJson(houseData);
        housesList.add(house);
      }
      return housesList
          .where(
            (item) =>
                item.city.toLowerCase().contains(filterText.toLowerCase()) ||
                item.zip.toLowerCase().contains(filterText.toLowerCase()),
          )
          .toList();
    } catch (e) {
      logger.warning('parseHousesFromJsonFiltered:Error: $e');
      rethrow;
    }
  }
}
