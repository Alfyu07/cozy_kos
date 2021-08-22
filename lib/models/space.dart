class Space {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List<String>? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Space({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBedrooms,
    this.numberOfCupboards,
  });

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['image_url'] as String?,
        price: json['price'] as int?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        rating: json['rating'] as int?,
        address: json['address'] as String?,
        phone: json['phone'] as String?,
        mapUrl: json['map_url'] as String?,
        photos: (json['photos'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        numberOfKitchens: json['number_of_kitchens'] as int?,
        numberOfBedrooms: json['number_of_bedrooms'] as int?,
        numberOfCupboards: json['number_of_cupboards'] as int?,
      );
}
