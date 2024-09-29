import 'package:flutter/material.dart';

class FarmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Section'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ppage1.png', // Replace with your top image file path
              height: 150.0, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Space between the top image and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-product');
              },
              child: Text('Add Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20), // Space between the button and the bottom image
            Image.asset(
              'assets/images/pppage2.png', // Replace with your bottom image file path
              height: 150.0, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
