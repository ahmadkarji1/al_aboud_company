class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    this.isFavorite = false,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    String? category,
    String? description,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}