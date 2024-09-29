import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/farmer_screen.dart';
import 'screens/consumer_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/bio_waste_screen.dart';
import 'screens/quotation_screen.dart';
import 'screens/checkout_screen.dart';
import 'models/product_provider.dart';
import 'screens/payment_screen.dart';
import 'screens/negotiation_screen.dart';
import 'screens/totalamt_screen.dart';
import 'screens/finalamt_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'FreshConnect',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.green[50],
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => HomeScreen(),
          '/farmer': (context) => FarmerScreen(),
          '/consumer': (context) => ConsumerScreen(),
          '/add-product': (context) => AddProductScreen(),
          '/bio-waste': (context) => BioWasteScreen(),
          '/quotation': (context) => QuotationScreen(),
          '/totalAmount': (context) => TotalAmountScreen(),
          '/finalAmount': (context) => FinalAmountScreen(),
           '/negotiation': (context) => NegotiationScreen(),
          '/checkout': (context) => CheckoutScreen(),
          '/payment': (context) => PaymentScreen() ,
        },
      ),
    );
  }
} 