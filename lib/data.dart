class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description; // الحقل الجديد

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description, // المُعامل الجديد
  });
}