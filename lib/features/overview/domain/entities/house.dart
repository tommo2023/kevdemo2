/// Represents a house with details
class House {
  /// Creates a new [House] instance with the specified parameters.
  ///
  /// - [id]: The unique identifier of the house.
  /// - [image]: The URL of the house's image.
  /// - [price]: The price of the house.
  /// - [bedrooms]: The number of bedrooms in the house.
  /// - [bathrooms]: The number of bathrooms in the house.
  /// - [size]: The size of the house in square feet.
  /// - [description]: A textual description of the house.
  /// - [zip]: The ZIP code of the house's location.
  /// - [city]: The city where the house is located.
  /// - [latitude]: The latitude coordinate of the house's location.
  /// - [longitude]: The longitude coordinate of the house's location.
  /// - [createdDate]: The date when the house was created or listed.

  House({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.description,
    required this.zip,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.createdDate,
  });

  /// Creates a [House] instance from a JSON map.
  ///
  /// This factory method is used to
  /// deserialize a JSON map into a [House] object.
  ///
  /// - [data]: A JSON map containing house data.
  ///
  /// Throws a [FormatException] if the JSON map is
  /// invalid or missing required fields.

  factory House.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    if (id is! int) {
      throw FormatException(
        'Invalid JSON: required "id" field of type int in $data',
      );
    }
    final image = data['image'];
    if (image is! String) {
      throw FormatException(
        'Invalid JSON: required "image" field of type String in $data',
      );
    }
    final price = data['price'];
    if (price is! int) {
      throw FormatException(
        'Invalid JSON: required "price" field of type int in $data',
      );
    }
    final bedrooms = data['bedrooms'];
    if (bedrooms is! int) {
      throw FormatException(
        'Invalid JSON: required "bedrooms" field of type int in $data',
      );
    }
    final bathrooms = data['bathrooms'];
    if (bathrooms is! int) {
      throw FormatException(
        'Invalid JSON: required "bathrooms" field of type int in $data',
      );
    }
    final size = data['size'];
    if (size is! int) {
      throw FormatException(
        'Invalid JSON: required "size" field of type int in $data',
      );
    }
    final description = data['description'];
    if (description is! String) {
      throw FormatException(
        'Invalid JSON: required "description" field of type String in $data',
      );
    }
    final zip = data['zip'];
    if (zip is! String) {
      throw FormatException(
        'Invalid JSON: required "zip" field of type String in $data',
      );
    }
    final city = data['city'];
    if (city is! String) {
      throw FormatException(
        'Invalid JSON: required "city" field of type String in $data',
      );
    }
    final latitude = data['latitude'];
    if (latitude is! int) {
      throw FormatException(
        'Invalid JSON: required "latitude" field of type int in $data',
      );
    }
    final longitude = data['longitude'];
    if (longitude is! int) {
      throw FormatException(
        'Invalid JSON: required "longitude" field of type int in $data',
      );
    }
    final createdDate = data['createdDate'];
    if (createdDate is! String) {
      throw FormatException(
        'Invalid JSON: required "createdDate" field of type String in $data',
      );
    }

    if (data
        case {
          'id': final int id,
          'image': final String image,
          'price': final int price,
          'bedrooms': final int bedrooms,
          'bathrooms': final int bathrooms,
          'size': final int size,
          'description': final String description,
          'zip': final String zip,
          'city': final String city,
          'latitude': final int latitude,
          'longitude': final int longitude,
          'createdDate': final String createdDate,
        }) {
      return House(
        id: id,
        image: image,
        price: price,
        bedrooms: bedrooms,
        bathrooms: bathrooms,
        size: size,
        description: description,
        zip: zip,
        city: city,
        latitude: latitude.toDouble(),
        longitude: longitude.toDouble(),
        createdDate: createdDate,
      );
    } else {
      throw FormatException('Invalid JSON: $data');
    }
  }

  /// The unique identifier of the house.
  int id;

  /// The URL of the house's image.
  String image;

  /// The price of the house.
  int price;

  /// The number of bedrooms in the house.
  int bedrooms;

  /// The number of bathrooms in the house.
  int bathrooms;

  /// The size of the house in square feet.
  int size;

  /// A textual description of the house.
  String description;

  /// The ZIP code of the house's location.
  String zip;

  /// The city where the house is located.
  String city;

  /// The latitude coordinate of the house's location.
  double latitude;

  /// The longitude coordinate of the house's location.
  double longitude;

  /// The date when the house was created or listed.
  String createdDate;
}
