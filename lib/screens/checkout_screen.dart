import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_provider.dart';
import 'payment_screen.dart'; // Import the PaymentScreen

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.green,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          final cart = productProvider.cart;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(cartItem.product.image), // Update path as needed
                        title: Text(cartItem.product.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price: ₹${cartItem.product.price.toStringAsFixed(2)}/kg'),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    productProvider.decreaseQuantity(cartItem);
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text('${cartItem.quantity} kg'),
                                IconButton(
                                  onPressed: () {
                                    productProvider.increaseQuantity(cartItem);
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            productProvider.removeFromCart(cartItem);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total: ₹${productProvider.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentScreen()), // Navigate to PaymentScreen
                        );
                      },
                      child: Text('Proceed to Payment'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
