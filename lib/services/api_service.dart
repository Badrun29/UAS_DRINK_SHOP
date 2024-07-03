import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/drink.dart';
import '../models/order.dart';

class ApiService {
  final String baseUrl = dotenv.env['API_BASE_URL']!;

  Future<List<Drink>> getDrinks() async {
    final response = await http.get(Uri.parse('$baseUrl/drinks'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((drink) => Drink.fromJson(drink)).toList();
    } else {
      throw Exception('Failed to load drinks');
    }
  }

  Future<Drink> createDrink(String name, String description, double price,
      int stock, String imageUrl) async {
    final response = await http.post(
      Uri.parse('$baseUrl/drinks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
        'imageUrl': imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      return Drink.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create drink');
    }
  }

  Future<Drink> updateDrinkStock(int id, int stock) async {
    final response = await http.put(
      Uri.parse('$baseUrl/drinks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'stock': stock,
      }),
    );

    if (response.statusCode == 200) {
      return Drink.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update drink stock');
    }
  }

  Future<Drink> updateDrinkPrice(int id, double price) async {
    final response = await http.put(
      Uri.parse('$baseUrl/drinks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'price': price,
      }),
    );

    if (response.statusCode == 200) {
      return Drink.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update drink price');
    }
  }

  Future<void> deleteDrink(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/drinks/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete drink');
    }
  }

  Future<Order> createOrder(int drinkId, int quantity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'drinkId': drinkId,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 200) {
      return Order.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create order');
    }
  }

  Future<List<Order>> getOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print('Response from server: $jsonResponse'); // Tambahkan logging ini
      return jsonResponse.map((order) => Order.fromJson(order)).toList();
    } else {
      print(
          'Failed to load orders: ${response.body}'); // Logging untuk melihat detail error
      throw Exception('Failed to load orders');
    }
  }
}
