class City {
  final int id;
  final String? name;
  final String? imageUrl;
  bool isPopular;

  City({
    required this.id,
    this.name,
    this.imageUrl,
    this.isPopular = false,
  });
}
