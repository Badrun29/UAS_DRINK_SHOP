// lib/models/drink.dart
class Drink {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String imageUrl;

  Drink({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
