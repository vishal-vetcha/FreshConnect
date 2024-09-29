import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productNameController = TextEditingController();
  final _quantityController = TextEditingController();
  double _price = 0.0;

  void _updatePrice() {
    // Example price mapping for 1 kg of each product
    final priceMap = {
      'Apple': 60.0,
      'Banana': 25.0,
      'Watermelon': 15.0,
      'Tomato': 24.0,
      'Onion': 20.0,
      'Potato': 22.0,
      'Green Leafy Vegetables': 27.0,
      'Cotton': 75.0,
    };

    final productName = _productNameController.text;
    final quantity = double.tryParse(_quantityController.text) ?? 0.0;

    if (priceMap.containsKey(productName)) {
      setState(() {
        _price = priceMap[productName]! * quantity;
      });
    } else {
      setState(() {
        _price = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Product Name'),
              onChanged: (_) => _updatePrice(),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (_) => _updatePrice(),
            ),
            SizedBox(height: 20),
            Text(
              'Estimated Price: ₹${_price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bio-waste');
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
