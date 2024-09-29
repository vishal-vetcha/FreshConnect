import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:farmer_consumer_app/main.dart';
import 'package:farmer_consumer_app/models/product_provider.dart';

void main() {
  testWidgets('Basic widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: MyApp(),
      ),
    );

    // Verify that HomeScreen is displayed
    expect(find.text('Farmer Consumer App'), findsOneWidget);

    // Check for Farmer and Consumer buttons on HomeScreen
    expect(find.text('Farmer'), findsOneWidget);
    expect(find.text('Consumer'), findsOneWidget);

    // Tap the 'Farmer' button and verify navigation
    await tester.tap(find.text('Farmer'));
    await tester.pumpAndSettle();
    expect(find.text('Farmer Dashboard'), findsOneWidget);

    // Navigate back to HomeScreen
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('Farmer Consumer App'), findsOneWidget);

    // Tap the 'Consumer' button and verify navigation
    await tester.tap(find.text('Consumer'));
    await tester.pumpAndSettle();
    expect(find.text('Consumer Dashboard'), findsOneWidget);
  });
}
