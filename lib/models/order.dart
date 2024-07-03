// lib/models/order.dart
class Order {
  final int id;
  final int drinkId;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.drinkId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? 0,
      drinkId: json['drinkId'] ?? 0,
      quantity: json['quantity'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
