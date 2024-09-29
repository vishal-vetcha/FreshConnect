import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [
    Product(name: 'Apple', price: 100.0, image: 'assets/images/apple.png'),
    Product(name: 'Banana', price: 36.0, image: 'assets/images/banana.png'),
    Product(name: 'Watermelon', price: 26.0, image: 'assets/images/watermelon.png'),
    Product(name: 'Tomato', price: 37.0, image: 'assets/images/tomato.png'),
    Product(name: 'Onion', price: 35.0, image: 'assets/images/onion.png'),
    Product(name: 'Potato', price: 35.0, image: 'assets/images/potato.png'),
    Product(name: 'Green Leafy Vegetables', price: 45, image: 'assets/images/greens.png'),
    Product(name: 'Cotton', price: 100.0, image: 'assets/images/cotton.png'),
  ];

  List<CartItem> _cart = [];

  List<Product> get products => _products;

  List<CartItem> get cart => _cart;

  double get totalPrice => _cart.fold(0.0, (total, item) => total + item.product.price * item.quantity);

  void addToCart(Product product) {
    final existingItemIndex = _cart.indexWhere((item) => item.product.name == product.name);

    if (existingItemIndex >= 0) {
      _cart[existingItemIndex].quantity += 1;
    } else {
      _cart.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _cart.remove(cartItem);
    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity -= 1;
    } else {
      _cart.remove(cartItem);
    }
    notifyListeners();
  }
}
