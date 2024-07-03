import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../models/drink.dart';

class UpdateDrinkPage extends StatefulWidget {
  final Drink drink;

  UpdateDrinkPage({required this.drink});

  @override
  _UpdateDrinkPageState createState() => _UpdateDrinkPageState();
}

class _UpdateDrinkPageState extends State<UpdateDrinkPage> {
  late TextEditingController stockController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    stockController =
        TextEditingController(text: widget.drink.stock.toString());
    priceController =
        TextEditingController(text: widget.drink.price.toString());
  }

  @override
  void dispose() {
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<ApiService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Drink'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: stockController,
              decoration: InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final int stock = int.parse(stockController.text);
                final double price = double.parse(priceController.text);

                await apiService.updateDrinkStock(widget.drink.id, stock);
                await apiService.updateDrinkPrice(widget.drink.id, price);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Updated stock and price for ${widget.drink.name}')),
                );

                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
